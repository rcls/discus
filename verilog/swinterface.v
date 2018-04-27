module swinterface(input wire cpu_clk_ext,
                   input wire cpu_reset,
                   input wire clkin100,
                   output wire clkin100_en,
                   input wire cpu_clk_sel,
                   input wire ssp1_sck,
                   input wire ssp1_ssel,
                   input wire ssp1_mosi,
                   output reg ssp1_miso,
                   output wire [7:0] led);

   // SPI registers:
   // 0 : address.
   // 1 : program write.
   // 2 : memory_read;
   // 3 : memory write.
   // prog & mem commands auto-inc the address.
   // Transactions are 10-bit.

   reg sck_iob;
   reg ss_iob;
   reg mosi_iob;

   reg sck_buf;
   reg ss_buf;

   reg [7:0] snoopd;
   reg [7:0] snoopa;
   wire [7:0] snoopq;
   reg snoopp;
   reg snoopm;

   assign clkin100_en = 1'b1;
   wire clk_main = clkin100;

   discus cpu(.clk(cpu_clk), .reset(cpu_reset), .snoop_clk(clk_main),
     .snoopa(snoopa), .snoopd(snoopd), .snoopq(snoopq),
     .snoopm(snoopm), .snoopp(snoopp));

   // The LEDs are negative logic.
   watchdog w_clk(clk_main, !sck_iob, led[0]);
   watchdog w_ssel(clk_main, ss_iob, led[1]);
   watchdog w_mosi(clk_main, mosi_iob, led[2]);
   watchdog w_cpuclk(clk_main, !cpu_clk_ext, led[3]);
   watchdog w_reset(clk_main, !cpu_reset, led[4]);
   assign led[5] = 1;
   assign led[6] = 1;
   assign led[7] = 1;

   PLL_BASE #(
     .CLKFBOUT_MULT(10),
     .CLKOUT0_DIVIDE(4),
     // .CLKOUT1_DIVIDE(10),
     .DIVCLK_DIVIDE(1),
     .CLK_FEEDBACK("CLKFBOUT")) clkgen
     (.CLKIN(clkin100),
     .CLKOUT0(clk250mhz),
     // .CLKOUT1(clk_main),
     .CLKFBOUT(clkgen_fb),
     .CLKFBIN(clkgen_fb)
     );

   BUFGMUX cpu_clk_mux (.I1(cpu_clk_ext), .I0(clk250mhz), .S(cpu_clk_sel), .O(cpu_clk));

   always@(posedge clk_main) begin : inputbuffers
      ss_iob <= ssp1_ssel;
      sck_iob <= ssp1_sck;
      mosi_iob <= ssp1_mosi;

      sck_buf <= sck_iob;
      ss_buf <= ss_iob;
   end

   always@(posedge clk_main) begin : swspi
      reg [1:0] bit_ctr;
      reg [1:0] spi_op;
      reg [7:0] spi_q;

      reg sck_rise;
      reg ss_rise;
      reg increment;

      sck_rise = sck_iob && !sck_buf;
      ss_rise = ss_iob && !ss_buf;

      if (sck_rise) begin
         if (bit_ctr == 0)
           spi_op[1] <= mosi_iob;
         if (bit_ctr == 1)
           spi_op[0] <= mosi_iob;
         if (bit_ctr < 2)
           bit_ctr <= bit_ctr + 1;

         // We're meant to set MISO on the falling edge of SCK.  Instead we use
         // the (delayed) copy of the rising edge.
         snoopd = { snoopd[6:0], mosi_iob };
         if (bit_ctr == 0) begin
            ssp1_miso <= 0;
            spi_q <= snoopq;
         end
         else begin
            ssp1_miso <= spi_q[7];
            spi_q <= { spi_q[6:0], 1'b0 };
         end
      end

      increment <= ss_rise;
      if (increment) begin
         if (spi_op == 2'b00)
           snoopa <= snoopd;
         else
           snoopa <= snoopa + 1;
      end

      if (ss_iob)
         bit_ctr <= 0;

      snoopp <= (spi_op == 2'b01 && ss_rise);
      snoopm <= (spi_op == 2'b11 && ss_rise);
   end

endmodule

module watchdog(input wire clk, input wire I, output reg O);

   // Stretch transitions on I onto O: If we are not counting, and I/=O then
   // flip O and reset the counter.

   reg[24:0] counter;
   reg II;

   always@(posedge clk) begin
      II <= I;
      if (counter[24] && II != O) begin
         O <= II;
         counter <= 6777216;
      end;
      if (!counter[24])
        counter <= counter + 1;
   end
endmodule
