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

   reg       ph1_state;
   reg       ph2_state;
   reg       ph3_state;
   reg       ph4_state;
   reg       hp1_state;
   reg       hp2_state;
   reg       hp3_state;
   reg       hp4_state;

   reg [7:0] h_data_out;
   reg [7:0] p_data_out;

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

   // HP FIFO flags
   always @(*) begin
      if (!h_rst_b | t_flag | (!p_cs_b && !p_rd_b && p_addr == 3'b001))
        hp1_state = 1'b0;
      else if (h_phi2 && !h_cs_b && !h_rdnw && h_addr == 3'b001)
        hp1_state = 1'b1;
      if (!h_rst_b | t_flag | (!p_cs_b && !p_rd_b && p_addr == 3'b011))
        hp2_state = 1'b0;
      else if (h_phi2 && !h_cs_b && !h_rdnw && h_addr == 3'b011)
        hp2_state = 1'b1;
      if (!h_rst_b | t_flag | (!p_cs_b && !p_rd_b && p_addr == 3'b101))
        hp3_state = 1'b0;
      else if (h_phi2 && !h_cs_b && !h_rdnw && h_addr == 3'b101)
        hp3_state = 1'b1;
      if (!h_rst_b | t_flag | (!p_cs_b && !p_rd_b && p_addr == 3'b111))
        hp4_state = 1'b0;
      else if (h_phi2 && !h_cs_b && !h_rdnw && h_addr == 3'b111)
        hp4_state = 1'b1;
   end

   // PH FIFO flags
   always @(*) begin
      if (!h_rst_b | t_flag | (h_phi2 && !h_cs_b && h_rdnw && h_addr == 3'b001))
        ph1_state = 1'b0;
      else if (!p_cs_b && !p_wr_b && p_addr == 3'b001)
        ph1_state = 1'b1;
      if (!h_rst_b | t_flag | (h_phi2 && !h_cs_b && h_rdnw && h_addr == 3'b011))
        ph2_state = 1'b0;
      else if (!p_cs_b && !p_wr_b && p_addr == 3'b011)
        ph2_state = 1'b1;
      if (h_phi2 && !h_cs_b && h_rdnw && h_addr == 3'b101)
        ph3_state = 1'b0;
      else if (!h_rst_b | t_flag | (!p_cs_b && !p_wr_b && p_addr == 3'b101))
        ph3_state = 1'b1;
      if (!h_rst_b | t_flag | (h_phi2 && !h_cs_b && h_rdnw && h_addr == 3'b111))
        ph4_state = 1'b0;
      else if (!p_cs_b && !p_wr_b && p_addr == 3'b111)
        ph4_state = 1'b1;
   end

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
       3'b100: p_data_out = {p_nmi, !ph3_state, 6'b111111};
       3'b101: p_data_out = hp3_data;
       3'b110: p_data_out = {hp4_state, !ph4_state, 6'b111111};
       3'b111: p_data_out = hp4_data;
     endcase

   // p_data tristate buffer
   assign p_data = (!p_cs_b && !p_rd_b) ? p_data_out : 8'bZZZZZZZZ;

   // interrupt logic
   assign p_nmi = m_flag & (hp3_state | !ph3_state);
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
