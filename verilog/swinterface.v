module swinterface(input wire cpu_clk_ext,
                   input wire cpu_reset,
                   input wire clkin100,
                   output wire clkin100_en,
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

   wire khz_pulse;

   reg [7:0] memory[0:255];
   reg [7:0] prgram[0:255];
   wire memory_read;
   wire write;
   wire [7:0] memory_address;
   wire [7:0] memory_D;
   reg  [7:0] memory_Q;
   wire [7:0] fetch_PC;
   wire fetch_reset;
   reg [7:0] fetch_instruction;

   assign clkin100_en = 1'b1;
   wire clk_main = clkin100;

   discus cpu(.clk(cpu_clk_ext), .reset(cpu_reset),
     .memory_read(memory_read), .memory_write(memory_write),
     .memory_address(memory_address), .memory_D(memory_D), .memory_Q(memory_Q),
     .fetch_PC(fetch_PC), .fetch_reset(fetch_reset),
     .fetch_instruction(fetch_instruction));

   always@(posedge cpu_clk_ext) begin
      if (memory_read)
        memory_Q <= memory[memory_address];
      else
        memory_Q <= 0;

      if (memory_write)
        memory[memory_address] <= memory_D;

      if (fetch_reset)
        fetch_instruction <= 0;
      else
        fetch_instruction <= prgram[fetch_PC];
   end

   div100k khz_gen(clk_main, khz_pulse);

   // The LEDs are negative logic.
   watchdog w_clk   (clk_main, khz_pulse, !sck_iob,     led[0]);
   watchdog w_ssel  (clk_main, khz_pulse, ss_iob,       led[1]);
   watchdog w_mosi  (clk_main, khz_pulse, mosi_iob,     led[2]);
   watchdog w_cpuclk(clk_main, khz_pulse, !cpu_clk_ext, led[3]);
   watchdog w_reset (clk_main, khz_pulse, !cpu_reset,   led[4]);
   assign led[5] = 1;
   assign led[6] = 1;
   assign led[7] = 1;

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

      reg [7:0] snoopa;
      reg [7:0] snoopd;
      reg [7:0] snoopq;
      reg snoopm;
      reg snoopp;

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

      if (snoopp)
        prgram[snoopa] <= snoopd;

      if (snoopm)
        memory[snoopa] <= snoopd;

      snoopq <= memory[snoopa];
   end
endmodule

module div100k(input wire clk, output reg pulse);
   reg [17:0] counter;

   always@(posedge clk) begin
      pulse <= counter[17];
      if (counter[17])
        counter <= counter - 99999;
      else
        counter <= counter + 1;
   end
endmodule

module watchdog(input wire clk, input wire en, input wire I, output reg O);

   // Stretch transitions on I onto O: If we are not counting, and I/=O then
   // flip O and reset the counter.

   reg[7:0] counter;
   reg II;

   always@(posedge clk) begin
      II <= I;
      if (counter[7] && II != O) begin
         O <= II;
         counter <= 28;
      end
      else if (en)
        counter <= counter + 1;
   end
endmodule
