`timescale 1ns /1ns

// Resource Usage (Macrocells) in a EPM7128STC100 in Quartus II 13.0SP1
//
//                         Area          Speed        Area          Speed
// R124         R3         Constrained   Constrained  UnConstrained UnConstrained
// shared       one-byte   72            74           72            74
// shared       two-byte   101           104          100           104
// exclusive    one-byte   106           106          106           106
// exclusive    two-byte   145*          138*         131*          128*
//
// (*) Would not Fit and/or would not route

// Implementation options for R1/R2/R4
//
// The shared implementation saves ~34 macrocells

`define R124_FIFO_IMPL r124_fifo_onebyte_shared
// `define R124_FIFO_IMPL r124_fifo_onebyte_exclusive

// Implementation options for R3
//
// The one-byte implementation saves ~30 macrocells

`define R3_FIFO_IMPL r3_fifo_onebyte
// `define R3_FIFO_IMPL r3_fifo_twobyte

// Uncomment for a more efficient implementation of the R124 Flags
// when targeting XC9500XL CPLD (saves 6 microcells). This works less
// well with the Altera EPM7128S in Quartus!
//
//                         Area          Speed        Area          Speed
// R124         R3         Constrained   Constrained  UnConstrained UnConstrained
// shared       one-byte   78    +6      80    +6     75      +3    77    +3
// shared       two-byte   123   +22     102   -2     100      0    107   +3
// exclusive    one-byte   109   +3      112   +6     109     +3    109   +3
// exclusive    two-byte   144+  -1      142*  +4     127*    -4    128*   0
//

//`define XC9572XL

module tube
  (
   input [2:0] h_addr,
   input       h_cs_b,
   inout [7:0] h_data,
   input       h_phi2,
   input       h_rdnw,
   input       h_rst_b,
`ifndef XC9572XL
   output      h_irq_b,
   output      drq,
   input       dack_b,
`endif
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
   reg [6:0]   control = 7'b1111111;

   wire        t_flag = control[6]; // Tube reset: a '1' holds the PH/HP FIFOs in their reset state
   wire        p_flag = control[5]; // Parasite reset a '1->0' transision p_rst_b to be asserted for 80us
   wire        v_flag = control[4]; // Two byte mode: a '1' causes PH3/HP3 to operate in two-byte mode
   wire        m_flag = control[3]; // PNMI from HP3 non-empty / PH3 empty
   wire        j_flag = control[2]; // PIEQ from HP4 non-empty
   wire        i_flag = control[1]; // PIRQ from HP1 non-empty
   wire        q_flag = control[0]; // HIRQ from PH4 non-empty

   wire [7:0]  ph1_data;
   wire [7:0]  ph2_data;
   wire [7:0]  ph3_data;
   wire [7:0]  ph4_data;
   wire [7:0]  hp1_data;
   wire [7:0]  hp2_data;
   wire [7:0]  hp3_data;
   wire [7:0]  hp4_data;

   wire        ph1_dav;
   wire        ph1_sav;
   wire        hp1_dav;
   wire        hp1_sav;
   wire        ph2_dav;
   wire        ph2_sav;
   wire        hp2_dav;
   wire        hp2_sav;
   wire        ph3_dav;
   wire        ph3_sav;
   wire        hp3_dav;
   wire        hp3_sav;
   wire        ph4_dav;
   wire        ph4_sav;
   wire        hp4_dav;
   wire        hp4_sav;

   reg [7:0]   h_data_out;
   reg [7:0]   p_data_out;

   wire        nmi_flag;

   // Detect parasite powered down
   wire        p_powered_off = !p_rd_b && !p_wr_b;

   // Reset
   wire        tube_reset = !h_rst_b | t_flag;

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


   // R1/R2/R4 FIFOs
   `R124_FIFO_IMPL hp1_hp2_hp4
     (
      .reset(tube_reset),
      .wclk(h_phi2),
      .wclken(!h_cs_b & !h_rdnw),
      .waddr(h_addr),
      .wdata(h_data),
      .rclk(!p_rd_b),
      .rclken(!p_cs_b),
      .raddr(p_addr),
      .dav1(hp1_dav),
      .sav1(hp1_sav),
      .data1(hp1_data),
      .dav2(hp2_dav),
      .sav2(hp2_sav),
      .data2(hp2_data),
      .dav4(hp4_dav),
      .sav4(hp4_sav),
      .data4(hp4_data)
      );
   `R124_FIFO_IMPL ph1_ph2_ph4
     (
      .reset(tube_reset),
      .wclk(!p_wr_b),
      .wclken(!p_cs_b),
      .waddr(p_addr),
      .wdata(p_data),
      .rclk(h_phi2),
      .rclken(!h_cs_b & h_rdnw),
      .raddr(h_addr),
      .dav1(ph1_dav),
      .sav1(ph1_sav),
      .data1(ph1_data),
      .dav2(ph2_dav),
      .sav2(ph2_sav),
      .data2(ph2_data),
      .dav4(ph4_dav),
      .sav4(ph4_sav),
      .data4(ph4_data)
      );


   // R3 FIFOs
   `R3_FIFO_IMPL
     #(
       .init_state(0),
       .empty_value(8'he4)
       )
   hp3
     (
      .wclk(h_phi2),
      .wclken(!h_cs_b & !h_rdnw & h_addr == 3'b101),
      .wdata(h_data),
      .rclk(!p_rd_b),
      .rclken(!p_cs_b & p_addr == 3'b101),
      .reset(tube_reset),
      .rdata(hp3_data),
      .v_flag(v_flag),
      .dav(hp3_dav),
      .sav(hp3_sav)
      );

   `R3_FIFO_IMPL
     #(
      .init_state(1),
      .empty_value(8'h96)
      )
   ph3
     (
      .wclk(!p_wr_b),
      .wclken(!p_cs_b & p_addr == 3'b101),
      .wdata(p_data),
      .rclk(h_phi2),
      .rclken(!h_cs_b & h_rdnw & h_addr == 3'b101),
      .reset(tube_reset),
      .rdata(ph3_data),
      .v_flag(v_flag),
      .dav(ph3_dav),
      .sav(ph3_sav)
      );

   // h_data multiplexor
   always @(*)
`ifndef XC9572XL
     if (p_powered_off)
       h_data_out = 8'hFE;
     else
`endif
     case (h_addr)
       3'b000: h_data_out = {ph1_dav, hp1_sav, control[5:0]};
       3'b001: h_data_out = ph1_data;
       3'b010: h_data_out = {ph2_dav, hp2_sav, 6'b111111};
       3'b011: h_data_out = ph2_data;
       3'b100: h_data_out = {ph3_dav, hp3_sav, 6'b111111};
       3'b101: h_data_out = ph3_data;
       3'b110: h_data_out = {ph4_dav, hp4_sav, 6'b111111};
       3'b111: h_data_out = ph4_data;
     endcase

   // h_data tristate buffer
`ifdef XC9572XL
   assign h_data = (h_phi2 && !h_cs_b && h_rdnw && !p_powered_off) ? h_data_out : 8'bZZZZZZZZ;
`else
   assign h_data = (h_phi2 && !h_cs_b && h_rdnw) ? h_data_out : 8'bZZZZZZZZ;
`endif

   // p_data multiplexor
   always @(*)
     case (p_addr)
       3'b000: p_data_out = {hp1_dav,  ph1_sav, control[5:0]};
       3'b001: p_data_out = hp1_data;
       3'b010: p_data_out = {hp2_dav,  ph2_sav, 6'b111111};
       3'b011: p_data_out = hp2_data;
       3'b100: p_data_out = {nmi_flag, ph3_sav, 6'b111111};
       3'b101: p_data_out = hp3_data;
       3'b110: p_data_out = {hp4_dav,  ph4_sav, 6'b111111};
       3'b111: p_data_out = hp4_data;
     endcase

   // p_data tristate buffer
   assign p_data = (!p_cs_b && !p_rd_b && p_wr_b) ? p_data_out : 8'bZZZZZZZZ;

   // reset logic
   assign p_rst_b = (!h_rst_b | p_flag | p_powered_off) ? 1'b0 : 1'b1;

   // interrupt logic
   assign nmi_flag = hp3_dav | ph3_sav;
   assign p_nmi_b = !(m_flag & nmi_flag | p_powered_off);
   assign p_irq_b = !((j_flag & hp4_dav) | (i_flag & hp1_dav) | p_powered_off);

`ifndef XC9572XL
   assign h_irq_b = (q_flag & ph4_dav) ? 1'b0 : 1'bZ;
   // DMA not implemented
   assign drq = 1'b0;
`endif

endmodule

// A minimal implementation of the R1/R2/R4 fifos (in one direction)
// that shared a single 8-bit data register between the three FIFOs
// while still maintaining seperate flags. Credit for this idea goes
// to John Kortink, who used it in the original ReTuLa project.

module r124_fifo_onebyte_shared
  (
   input            reset,
   input            wclk,
   input            wclken,
   input [2:0]      waddr,
   input [7:0]      wdata,
   input            rclk,
   input            rclken,
   input [2:0]      raddr,
   output           dav1,
   output           sav1,
   output     [7:0] data1,
   output           dav2,
   output           sav2,
   output     [7:0] data2,
   output           dav4,
   output           sav4,
   output     [7:0] data4
   );

   reg [7:0]        data;

   always @(negedge wclk)
     if (wclken)
       case (waddr)
         3'b001: data <= wdata;
         3'b011: data <= wdata;
         3'b111: data <= wdata;
       endcase

`ifdef XC9572XL
   wire s1 = (wclk & wclken & waddr == 3'b001);
   wire r1 = (       rclken & raddr == 3'b001);
   wire s2 = (wclk & wclken & waddr == 3'b011);
   wire r2 = (       rclken & raddr == 3'b011);
   wire s4 = (wclk & wclken & waddr == 3'b111);
   wire r4 = (       rclken & raddr == 3'b111);

   as_ar_dff state_inst_1 (.clk(rclk), .s(s1), .r(reset), .clken(r1), .d(1'b0), .q(dav1));
   as_ar_dff state_inst_2 (.clk(rclk), .s(s2), .r(reset), .clken(r2), .d(1'b0), .q(dav2));
   as_ar_dff state_inst_3 (.clk(rclk), .s(s4), .r(reset), .clken(r4), .d(1'b0), .q(dav4));
`else
   wire s1 = (       wclken & waddr == 3'b001);
   wire r1 = (rclk & rclken & raddr == 3'b001) | reset;
   wire s2 = (       wclken & waddr == 3'b011);
   wire r2 = (rclk & rclken & raddr == 3'b011) | reset;
   wire s4 = (       wclken & waddr == 3'b111);
   wire r4 = (rclk & rclken & raddr == 3'b111) | reset;

   ar_dff state_inst_1 (.clk(wclk), .r(r1), .clken(s1), .d(1'b1), .q(dav1));
   ar_dff state_inst_2 (.clk(wclk), .r(r2), .clken(s2), .d(1'b1), .q(dav2));
   ar_dff state_inst_3 (.clk(wclk), .r(r4), .clken(s4), .d(1'b1), .q(dav4));
`endif
   assign data1 = data;
   assign data2 = data;
   assign data4 = data;

   assign sav1 = !dav1 & !dav2 & !dav4;
   assign sav2 = !dav1 & !dav2 & !dav4;
   assign sav4 = !dav1 & !dav2 & !dav4;

endmodule

// A implementation of the R1/R2/R4 fifos (in one direction) that uses
// a seperate 8-bit data register for each of the the three FIFOs.

module r124_fifo_onebyte_exclusive
  (
   input            reset,
   input            wclk,
   input            wclken,
   input [2:0]      waddr,
   input [7:0]      wdata,
   input            rclk,
   input            rclken,
   input [2:0]      raddr,
   output           dav1,
   output           sav1,
   output reg [7:0] data1,
   output           dav2,
   output           sav2,
   output reg [7:0] data2,
   output           dav4,
   output           sav4,
   output reg [7:0] data4
   );

   always @(negedge wclk)
     if (wclken)
       case (waddr)
         3'b001: data1 <= wdata;
         3'b011: data2 <= wdata;
         3'b111: data4 <= wdata;
       endcase

`ifdef XC9572XL
   wire s1 = (wclk & wclken & waddr == 3'b001);
   wire r1 = (       rclken & raddr == 3'b001);
   wire s2 = (wclk & wclken & waddr == 3'b011);
   wire r2 = (       rclken & raddr == 3'b011);
   wire s4 = (wclk & wclken & waddr == 3'b111);
   wire r4 = (       rclken & raddr == 3'b111);

   as_ar_dff state_inst_1 (.clk(rclk), .s(s1), .r(reset), .clken(r1), .d(1'b0), .q(dav1));
   as_ar_dff state_inst_2 (.clk(rclk), .s(s2), .r(reset), .clken(r2), .d(1'b0), .q(dav2));
   as_ar_dff state_inst_3 (.clk(rclk), .s(s4), .r(reset), .clken(r4), .d(1'b0), .q(dav4));
`else
   wire s1 = (       wclken & waddr == 3'b001);
   wire r1 = (rclk & rclken & raddr == 3'b001) | reset;
   wire s2 = (       wclken & waddr == 3'b011);
   wire r2 = (rclk & rclken & raddr == 3'b011) | reset;
   wire s4 = (       wclken & waddr == 3'b111);
   wire r4 = (rclk & rclken & raddr == 3'b111) | reset;

   ar_dff state_inst_1 (.clk(wclk), .r(r1), .clken(s1), .d(1'b1), .q(dav1));
   ar_dff state_inst_2 (.clk(wclk), .r(r2), .clken(s2), .d(1'b1), .q(dav2));
   ar_dff state_inst_3 (.clk(wclk), .r(r4), .clken(s4), .d(1'b1), .q(dav4));
`endif
   assign sav1 = !dav1;
   assign sav2 = !dav2;
   assign sav4 = !dav4;

endmodule

// A one-byte deep implementation of the R3 FIFO

module r3_fifo_onebyte
  (
   input            wclk,
   input            wclken,
   input [7:0]      wdata,
   input            rclk,
   input            rclken,
   input            reset,
   output reg [7:0] rdata,
   input            v_flag,
   output           dav,
   output           sav
   );

   parameter    init_state = 0;
   parameter    empty_value = 0; // Ignored

   wire         r3_state;
   wire         r3_set   = (       wclken) | (reset & init_state);
   wire         r3_reset = (rclk & rclken) | (reset & !init_state);

   ar_dff state (.clk(wclk), .r(r3_reset), .clken(r3_set), .d(1'b1), .q(r3_state));

   always @(negedge wclk)
     if (wclken)
       rdata <= wdata;

   assign dav = r3_state;
   assign sav = !r3_state;

endmodule

// A two-byte deep implementation of the R3 FIFO

module r3_fifo_twobyte
  (
   input        wclk,
   input        wclken,
   input [7:0]  wdata,
   input        rclk,
   input        rclken,
   input        reset,
   output [7:0] rdata,
   input        v_flag,
   output       dav,
   output       sav
   );

   parameter    init_state = 0;
   parameter    empty_value = 0;

   reg          rptr;
   reg          wptr;
   reg          full;
   reg          empty;
   reg [7:0]    data[0:1];


   // On reset, wptr = initial state
   always @(negedge wclk or posedge reset)
     if (reset)
       wptr <= init_state; // async set or async clear
     else if (wclken & !full) begin
        data[wptr] <= wdata;
        wptr <= !wptr;
     end

   // On reset, rptr = 0
   always @(negedge rclk or posedge reset)
     if (reset)
       rptr <= 1'b0; // async clear
     else if (rclken & !empty) begin
        rptr <= !rptr;
     end

   // On reset, full = 0
   wire clrfull = reset | (rclk & rclken);
   always @(negedge wclk or posedge clrfull)
     if (clrfull)
       full <= 1'b0; // async clear
     else if (wclken & !full)
       full <= rptr != wptr;

   // On reset, empty = !initial_state, which is done with an async set
   wire clrempty = (reset & (init_state == 1)) | (wclk & wclken);
   wire setempty = (reset & (init_state == 0));
   always @(negedge rclk or posedge setempty or posedge clrempty)
     if (setempty)
       empty <= 1'b1; // async set
     else if (clrempty)
       empty <= 1'b0; // async clear
     else if (rclken & !empty)
       empty <= rptr != wptr;

   assign rdata = empty ? empty_value : data[rptr];

   // TODO: this is not quite right, because in 2-byte mode the flags
   // should exhibit hysteresis, but they don't here.
   //
   //      2-byte  1-byte
   //      dav sav dav sav
   // 00 0  0   1   0   1 (empty)
   // 01 1  0   1   1   0
   // 11 2  1   0   1   0 (full)
   // 10 1  1   0   1   0
   // 00 0  0   1   0   1 (empty)

   assign dav = v_flag ? full : !empty;
   assign sav = empty;

endmodule

// A DFF with an asynchronous reset, used as a flag primitive

module ar_dff
  (
   input clk,
   input clken,
   input d,
   input r,
   output reg q
   );
  always @(negedge clk or posedge r)
    if (r)
      q = 0;
    else if (clken)
      q = d;
endmodule

// A DFF with an asynchronous set, used as a flag primitive

module as_ar_dff
  (
   input clk,
   input clken,
   input d,
   input r,
   input s,
   output reg q
   );
  always @(negedge clk or posedge r or posedge s)
    if (r)
      q = 0;
   else if (s)
      q = 1;
    else if (clken)
      q = d;
endmodule

// An RS Latch, not currently used

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
endmodule

//PIN: CHIP "tube" ASSIGNED TO AN TQFP100
//PIN: h_addr_2 : 77
//PIN: h_addr_1 : 76
//PIN: h_addr_0 : 75
//PIN: h_cs_b   : 79
//PIN: h_data_7 : 72
//PIN: h_data_6 : 70
//PIN: h_data_5 : 64
//PIN: h_data_4 : 60
//PIN: h_data_3 : 56
//PIN: h_data_2 : 44
//PIN: h_data_1 : 42
//PIN: h_data_0 : 35
//PIN: h_phi2   : 85
//PIN: h_rdnw   : 78
//PIN: h_rst_b  : 89
//PIN: h_irq_b  : 48
//PIN: drq      : 47
//PIN: dack_b   : 99
//PIN: p_addr_2 : 100
//PIN: p_addr_1 :  1
//PIN: p_addr_0 : 96
//PIN: p_cs_b   : 97
//PIN: p_data_7 :  2
//PIN: p_data_6 :  6
//PIN: p_data_5 : 12
//PIN: p_data_4 : 16
//PIN: p_data_3 : 19
//PIN: p_data_2 : 25
//PIN: p_data_1 : 30
//PIN: p_data_0 : 33
//PIN: p_rd_b   : 87
//PIN: p_wr_b   : 90
//PIN: p_rst_b  : 46
//PIN: p_nmi_b  : 49
//PIN: p_irq_b  : 29
