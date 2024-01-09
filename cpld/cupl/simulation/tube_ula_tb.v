`timescale 1 ns / 100 ps

module tube_ula_testbench();

   wire       h_phi2;
   reg        h_phi2early;
   reg        h_rst_b;
   reg        h_cs_b;
   reg        h_rdnw;
   reg [2:0]  h_addr;
   reg [7:0]  h_datain;
   wire [7:0] h_data;
   wire       h_irq_b;

   reg [2:0]  p_addr;
   reg        p_cs_b;
   reg        p_rd_b;
   wire       p_rd_b_gated;
   reg        p_wr_b;
   wire       p_wr_b_gated;
   reg [7:0]  p_datain;
   wire [7:0] p_data;
   wire       p_irq_b;
   wire       p_nmi_b;
   wire       p_rst_b;

   task host_write;
      input [2:0] addr;
      input [7:0] data;
      begin
         @ (negedge h_phi2);
         h_addr = addr;
         h_datain = data;
         h_rdnw = 0;
         h_cs_b = 0;
         @ (negedge h_phi2);
         h_cs_b = 1;
         h_addr = 3'b000;
         h_datain = 8'bZZZZZZZZ;
         h_rdnw = 1;
      end
   endtask

   task host_read;
      input [2:0] addr;
      input [7:0] expected_mask;
      input [7:0] expected_data;
      begin
         @ (negedge h_phi2);
         h_addr = addr;
         h_rdnw = 1;
         h_cs_b = 0;
         @ (posedge h_phi2);
         if ((h_data & expected_mask) != expected_data)
           $display("%0dns: host addr %0d data error detected; expected_mask = %b; expected_data = %b; actual_data = %b", $time, h_addr, expected_mask, expected_data, h_data);
         @ (negedge h_phi2);
         h_cs_b = 1;
         h_addr = 3'b000;
         h_rdnw = 1;
      end
   endtask

   task para_write;
      input [2:0] addr;
      input [7:0] data;
      begin
         @ (negedge h_phi2);
         p_addr = addr;
         p_datain = data;
         p_wr_b = 0;
         p_cs_b = 0;
         @ (negedge h_phi2);
         p_cs_b = 1;
         p_addr = 3'b000;
         p_datain = 8'bZZZZZZZZ;
         p_wr_b = 1;
      end
   endtask

   task para_read;
      input [2:0] addr;
      input [7:0] expected_mask;
      input [7:0] expected_data;
      begin
         @ (negedge h_phi2);
         p_addr = addr;
         p_rd_b = 0;
         p_cs_b = 0;
         @ (posedge h_phi2);
         if ((p_data & expected_mask) != expected_data)
           $display("%0dns: para addr %0d data error detected; expected_mask = %b; expected_data = %b; actual_data = %b", $time, p_addr, expected_mask, expected_data, p_data);
         @ (negedge h_phi2);
         p_cs_b = 1;
         p_addr = 3'b000;
         p_rd_b = 1;
      end
   endtask

   task delay;
      input integer n;
      begin
         repeat (n)
           begin
              @ (negedge h_phi2);
           end
      end
   endtask

   task test_host_to_para_fifo;
      input [2:0] status_reg;
      input [2:0] data_reg;
      input integer num;
      begin
         $display();
         $display("Testing host to para status_reg=%0d, data_reg=%0d, num=%0d", status_reg, data_reg, num);
         // Initial FIFO state should be empty
         // Bit 7 is Data Available, Bit 6 is Space Available
         host_read(status_reg, 8'b11000000, 8'b01000000);
         para_read(status_reg, 8'b11000000, 8'b01000000);
         for (i = 0; i < num; i = i + 1)
           begin
              host_write(data_reg, 170 + i); // write to host
           end
         // Intermediate FIFO state should be full
         host_read(status_reg, 8'b11000000, 8'b00000000);
         para_read(status_reg, 8'b11000000, 8'b11000000);
         for (i = 0; i < num; i = i + 1)
           begin
              para_read(data_reg, 8'b11111111, 170 + i);         // read from para
           end
         // Initial FIFO state should be empty
         host_read(status_reg, 8'b11000000, 8'b01000000);
         para_read(status_reg, 8'b11000000, 8'b01000000);
      end
   endtask

   task test_para_to_host_fifo;
      input [2:0] status_reg;
      input [2:0] data_reg;
      input integer num;
      begin
         $display();
         $display("Testing para to host status_reg=%0d, data_reg=%0d, num=%0d", status_reg, data_reg, num);
         // Initial FIFO state should be empty
         // Bit 7 is Data Available, Bit 6 is Space Available
         para_read(status_reg, 8'b11000000, 8'b01000000);
         host_read(status_reg, 8'b11000000, 8'b01000000);
         for (i = 0; i < num; i = i + 1)
           begin
              para_write(data_reg, 170 + i); // write to para
           end
         // Intermediate FIFO state should be full
         para_read(status_reg, 8'b11000000, 8'b00000000);
         host_read(status_reg, 8'b11000000, 8'b11000000);
         for (i = 0; i < num; i = i + 1)
           begin
              host_read(data_reg, 8'b11111111, 170 + i);     // read from host
           end
         // Initial FIFO state should be empty
         para_read(status_reg, 8'b11000000, 8'b01000000);
         host_read(status_reg, 8'b11000000, 8'b01000000);
      end
   endtask

   // Instantaiate gate level design

   tube U1
     (
      .h_addr2(h_addr[2]),
      .h_addr1(h_addr[1]),
      .h_addr0(h_addr[0]),
      .h_cs_b(h_cs_b),
      .h_data7(h_data[7]),
      .h_data6(h_data[6]),
      .h_data5(h_data[5]),
      .h_data4(h_data[4]),
      .h_data3(h_data[3]),
      .h_data2(h_data[2]),
      .h_data1(h_data[1]),
      .h_data0(h_data[0]),
      .h_phi2(h_phi2early),
      .h_rst_b(h_rst_b),
      .h_rdnw(h_rdnw),
      .h_irq_b(h_irq_b),
      .p_addr2(p_addr[2]),
      .p_addr1(p_addr[1]),
      .p_addr0(p_addr[0]),
      .p_cs_b(p_cs_b),
      .p_data7(p_data[7]),
      .p_data6(p_data[6]),
      .p_data5(p_data[5]),
      .p_data4(p_data[4]),
      .p_data3(p_data[3]),
      .p_data2(p_data[2]),
      .p_data1(p_data[1]),
      .p_data0(p_data[0]),
      .p_rd_b(p_rd_b_gated),
      .p_wr_b(p_wr_b_gated),
      .p_irq_b(p_irq_b),
      .p_nmi_b(p_nmi_b),
      .p_rst_b(p_rst_b )
      );

   integer i;

   initial
     begin

        $dumpvars;


        h_addr = 3'b000;
        h_cs_b = 1;
        h_datain = 8'bZZZZZZZZ;
        h_phi2early = 0;
        h_rst_b = 1;
        h_rdnw = 1;
        p_addr = 3'b000;
        p_cs_b = 1;
        p_datain = 8'bZZZZZZZZ;
        p_rd_b = 1;
        p_wr_b = 1;

        // Synchronously assert h_rst_b for 50 clocks

        @ (negedge h_phi2);
        h_rst_b = 0;
        repeat (50)
          begin
             @ (negedge h_phi2);
          end
        h_rst_b = 1;

        delay(10);

        // Take p_rst_b high, low, high
        host_write(3'b000, 8'b00100000);
        host_write(3'b000, 8'b10100000);
        host_write(3'b000, 8'b00100000);
        host_read(3'b000, 0, 0);
        delay(10);

        // De-Assert soft reset (up until this point it will be X)
        host_write(3'b000, 8'b01000000);
        delay(10);

        // Assert soft reset for atleast 24 clocks to flush the 24 byte FIFO
        host_write(3'b000, 8'b11000000);
        delay(50);

        // De-Assert  soft reset
        host_write(3'b000, 8'b01000000);
        delay(10);

        // Disable all interrupts
        host_write(3'b000, 8'b00001111);

        // Set two byte mode for register 3
        host_write(3'b000, 8'b00010000);

        // Enable NMI (M=1)
        host_write(3'b000, 8'b10001000);

        // Check the control bits are as expected
        $display();
        $display("Checking control bits");
        host_read(3'b000, 8'b11111111, 8'b01001000);

        // Read the junk byte out of register 3
        $display();
        $display("Reading junk out of PH3");
        para_read(3'b100, 8'b11000000, 8'b00000000); // N=0 _F=0
        host_read(3'b101, 0, 0);
        para_read(3'b100, 8'b11000000, 8'b11000000); // N=1 _F=1
        delay(10);


        // Test Host To Para

        // Test Register 1
        test_host_to_para_fifo(3'b000, 3'b001, 1);
        delay(10);
        // Test Register 2
        test_host_to_para_fifo(3'b010, 3'b011, 1);
        delay(10);
        // Test Register 3
        test_host_to_para_fifo(3'b100, 3'b101, 2);
        delay(10);
        // Test Register 4
        test_host_to_para_fifo(3'b110, 3'b111, 1);
        delay(10);

        // Test Para to Host

        // Test Register 1
        test_para_to_host_fifo(3'b000, 3'b001, 1);  // Note, VDU FIFO only 1 byte deep
        delay(10);
        // Test Register 2
        test_para_to_host_fifo(3'b010, 3'b011, 1);
        delay(10);
        // Test Register 3
        test_para_to_host_fifo(3'b100, 3'b101, 2);
        delay(10);
        // Test Register 4
        test_para_to_host_fifo(3'b110, 3'b111, 1);
        delay(10);

        delay(100);

        $finish;
     end

   always
     begin
        #500 h_phi2early = ~h_phi2early;
     end

   assign #250 h_phi2 = h_phi2early;

   assign p_rd_b_gated = p_rd_b | ~h_phi2early;
   assign p_wr_b_gated = p_wr_b | ~h_phi2early;

   assign h_data = h_datain;
   assign p_data = p_datain;

endmodule
