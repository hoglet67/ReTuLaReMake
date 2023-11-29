`timescale 1ns /1ns

module tube
  (
   input [2:0] h_addr,
   input       h_cs_b,
   inout [7:0] h_data,
   input       h_phi2,
   input       h_rdnw,
   input       h_rst_b,
   output      h_irq_b,
   output      drq,
   input       dack_b,
   input [2:0] p_addr,
   input       p_cs_b,
   inout [7:0] p_data,
   input       p_rd_b,
   input       p_wr_b,
   output      p_rst_b,
   output      p_nmi_b,
   output      p_irq_b
   );


   // Power up state
   reg [6:0] control = 7'b1111111;

   wire      t_flag = control[6]; // Tube reset: a '1' holds the PH/HP FIFOs in their reset state
   wire      p_flag = control[5]; // Parasite reset a '1->0' transision p_rst_b to be asserted for 80us
   wire      v_flag = control[4]; // Two byte mode: a '1' causes PH3/HP3 to operate in two-byte mode
   wire      m_flag = control[3]; // PNMI from HP3 non-empty / PH3 empty
   wire      j_flag = control[2]; // PIEQ from HP4 non-empty
   wire      i_flag = control[1]; // PIRQ from HP1 non-empty
   wire      q_flag = control[0]; // HIRQ from PH4 non-empty

   reg [7:0] ph1_data;
   reg [7:0] ph2_data;
   reg [7:0] ph3_data;
   reg [7:0] ph4_data;
   reg [7:0] hp1_data;
   reg [7:0] hp2_data;
   reg [7:0] hp3_data;
   reg [7:0] hp4_data;

   wire      ph1_state;
   wire      ph2_state;
   wire      ph3_state;
   wire      ph4_state;
   wire      hp1_state;
   wire      hp2_state;
   wire      hp3_state;
   wire      hp4_state;

   reg [7:0] h_data_out;
   reg [7:0] p_data_out;

   wire      nmi_flag;

   wire      p_nmi;
   wire      p_irq;
   wire      h_irq;

   // Control register
   always @(negedge h_phi2 or negedge h_rst_b)
     if (!h_rst_b)
       control <= 7'b0000001;
     else if (!h_rdnw && !h_cs_b && h_addr == 3'b000) begin
        if (h_data[7])
          control <= control | h_data[6:0];
        else
          control <= control & ~h_data[6:0];
     end

   // h_data FIFOs
   always @(negedge h_phi2)
     if (!h_cs_b && !h_rdnw)
       case (h_addr)
         3'b001: hp1_data <= h_data;
         3'b011: hp2_data <= h_data;
         3'b101: hp3_data <= h_data;
         3'b111: hp4_data <= h_data;
       endcase

   // p_data FIFOs
   always @(posedge p_wr_b)
     if (!p_cs_b)
       case (p_addr)
         3'b001: ph1_data <= p_data;
         3'b011: ph2_data <= p_data;
         3'b101: ph3_data <= p_data;
         3'b111: ph4_data <= p_data;
       endcase

   // FIFO flags

   wire tube_reset = !h_rst_b | t_flag;

   wire h_write = h_phi2 & !h_cs_b & !h_rdnw & h_addr[0];
   wire p_read  =          !p_cs_b & !p_rd_b & p_addr[0];

   wire hp1_s = (h_write & h_addr[2:1] == 2'b00);
   wire hp1_r = (p_read  & p_addr[2:1] == 2'b00) | tube_reset;
   wire hp2_s = (h_write & h_addr[2:1] == 2'b01);
   wire hp2_r = (p_read  & p_addr[2:1] == 2'b01) | tube_reset;
   wire hp3_s = (h_write & h_addr[2:1] == 2'b10);
   wire hp3_r = (p_read  & p_addr[2:1] == 2'b10) | tube_reset;
   wire hp4_s = (h_write & h_addr[2:1] == 2'b11);
   wire hp4_r = (p_read  & p_addr[2:1] == 2'b11) | tube_reset;

   rs_latch hp1_state_inst (.r(hp1_r), .s(hp1_s), .q(hp1_state));
   rs_latch hp2_state_inst (.r(hp2_r), .s(hp2_s), .q(hp2_state));
   rs_latch hp3_state_inst (.r(hp3_r), .s(hp3_s), .q(hp3_state));
   rs_latch hp4_state_inst (.r(hp4_r), .s(hp4_s), .q(hp4_state));

   wire p_write =          !p_cs_b & !p_wr_b & p_addr[0];
   wire h_read  = h_phi2 & !h_cs_b &  h_rdnw & h_addr[0];

   wire ph1_s = (p_write & p_addr[2:1] == 2'b00);
   wire ph1_r = (h_read  & h_addr[2:1] == 2'b00) | tube_reset;
   wire ph2_s = (p_write & p_addr[2:1] == 2'b01);
   wire ph2_r = (h_read  & h_addr[2:1] == 2'b01) | tube_reset;
   wire ph3_s = (p_write & p_addr[2:1] == 2'b10) | tube_reset;
   wire ph3_r = (h_read  & h_addr[2:1] == 2'b10);
   wire ph4_s = (p_write & p_addr[2:1] == 2'b11);
   wire ph4_r = (h_read  & h_addr[2:1] == 2'b11) | tube_reset;

   rs_latch ph1_state_inst (.r(ph1_r), .s(ph1_s), .q(ph1_state));
   rs_latch ph2_state_inst (.r(ph2_r), .s(ph2_s), .q(ph2_state));
   rs_latch ph3_state_inst (.r(ph3_r), .s(ph3_s), .q(ph3_state));
   rs_latch ph4_state_inst (.r(ph4_r), .s(ph4_s), .q(ph4_state));

   // h_data multiplexor
   always @(*)
     case (h_addr)
       3'b000: h_data_out = {ph1_state, !hp1_state, control[5:0]};
       3'b001: h_data_out = ph1_data;
       3'b010: h_data_out = {ph2_state, !hp2_state, 6'b111111};
       3'b011: h_data_out = ph2_data;
       3'b100: h_data_out = {ph3_state, !hp3_state, 6'b111111};
       3'b101: h_data_out = ph3_data;
       3'b110: h_data_out = {ph4_state, !hp4_state, 6'b111111};
       3'b111: h_data_out = ph4_data;
     endcase

   // h_data tristate buffer
   assign h_data = (h_phi2 && !h_cs_b && h_rdnw) ? h_data_out : 8'bZZZZZZZZ;

   // p_data multiplexor
   always @(*)
     case (p_addr)
       3'b000: p_data_out = {hp1_state, !ph1_state, control[5:0]};
       3'b001: p_data_out = hp1_data;
       3'b010: p_data_out = {hp2_state, !ph2_state, 6'b111111};
       3'b011: p_data_out = hp2_data;
       3'b100: p_data_out = {nmi_flag, !ph3_state, 6'b111111};
       3'b101: p_data_out = hp3_data;
       3'b110: p_data_out = {hp4_state, !ph4_state, 6'b111111};
       3'b111: p_data_out = hp4_data;
     endcase

   // p_data tristate buffer
   assign p_data = (!p_cs_b && !p_rd_b) ? p_data_out : 8'bZZZZZZZZ;

   // interrupt logic
   assign nmi_flag = hp3_state | !ph3_state;
   assign p_nmi = m_flag & nmi_flag;
   assign p_irq = (j_flag & hp4_state) | (i_flag & hp1_state);
   assign h_irq = q_flag & ph4_state;

   // interrupt tristate buffers
   assign p_nmi_b = p_nmi ? 1'b0 : 1'bZ;
   assign p_irq_b = p_irq ? 1'b0 : 1'bZ;
   assign h_irq_b = h_irq ? 1'b0 : 1'bZ;

   // reset logic (simplified)
   assign p_rst_b = (!h_rst_b | p_flag) ? 1'b0 : 1'b1;

   // DMA not implemented
   assign drq = 1'b0;

endmodule


module rs_latch
  (
   input r,
   input s,
   output reg q
   );

   always @(r or s)
      if (r)
        q = 0;
      else if (s)
        q = 1;

// Xilinx primitive...
//
//   LDCP latch
//     (
//      .CLR(r),
//      .PRE(s),
//      .Q(q),
//      .G(1'b0),
//      .D(1'b0)
//      );


endmodule
