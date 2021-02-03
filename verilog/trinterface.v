module trinterface(input wire BASE_UART0_rxd,
                   output reg BASE_UART0_txd,
                   output reg LED_RED_XA_SC,
                   output reg USERLED,
                   output reg FLED1,
                   output reg FLED2,
                   input wire sys_clk_i_0);

   // 703 D3 - JB2 FLED1 99 .. 100 B34_0 K6
   // 703 D4 - JB2 FLED2 90 .. 89 B34_25 U8

   wire io_clk;
   wire cpu_clk;

   wire memory_read;
   wire memory_write;
   wire [7:0] memory_address;
   wire [7:0] memory_D;
   bit [7:0] memory_Q;
   (* ram_style = "block" *)
   bit [7:0] memory[0:255];

   bit [7:0] program_address;
   bit [7:0] program_data;
   bit program_w;
   (* ram_style = "block" *)
   bit [7:0] prgram[0:255];
   wire [7:0] fetch_PC;
   wire fetch_reset;
   bit [7:0] fetch_instruction;

   bit cpu_reset = 1;

   discus cpu(.clk(cpu_clk), .reset(cpu_reset),
     .memory_read(memory_read), .memory_write(memory_write),
     .memory_address(memory_address), .memory_D(memory_D), .memory_Q(memory_Q),
     .fetch_PC(fetch_PC), .fetch_reset(fetch_reset),
     .fetch_instruction(fetch_instruction));

   always@(posedge cpu_clk) begin
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

   initial BASE_UART0_txd = 1;

   wire io_read;
   bit [7:0] io_Q;
   wire [7:0] io_D;
   wire [7:0] io_address;
   wire [7:0] io_PC;
   wire io_reset;
   bit [7:0] io_instruction;

   (* ram_style = "block" *)
   bit [7:0] io_program[255:0];
   initial $readmemh("monitor.mem", io_program);

   discus io(.clk(io_clk), .reset(0),
     .memory_read(io_read), .memory_write(io_write),
     .memory_address(io_address), .memory_D(io_D), .memory_Q(io_Q),
     .fetch_PC(io_PC), .fetch_reset(io_reset), .fetch_instruction(io_instruction));

   always@(posedge io_clk)
     if (io_reset)
       io_instruction <= 0;
     else
       io_instruction <= io_program[io_PC];

   always@(posedge io_clk) begin
      bit [7:0] data;
      bit [7:0] data_data;
      bit [7:0] data_address;
      bit [3:0] leds;
      bit program_aw;
      bit data_w;
      bit data_aw;
      bit tx_w;
      bit led_w;
      bit reset_w;
      bit serial_rx;

      serial_rx <= BASE_UART0_rxd;
      data <= io_D;
      program_aw <= (io_address[2:0] == 0 && io_write);
      program_w  <= (io_address[2:0] == 1 && io_write);
      data_aw    <= (io_address[2:0] == 2 && io_write);
      data_w     <= (io_address[2:0] == 3 && io_write);
      tx_w       <= (io_address[2:0] == 4 && io_write);
      led_w      <= (io_address[2:0] == 5 && io_write);
      reset_w    <= (io_address[2:0] == 6 && io_write);

      if (program_aw)
        program_address <= data;

      if (program_w)
        prgram[program_address] <= data;

      if (data_aw)
        data_address <= data;

      if (data_w)
        memory[data_address] <= data;

      if (led_w)
        leds <= data[3:0];

      FLED2         <= leds[3];
      LED_RED_XA_SC <= leds[2];
      USERLED       <= !leds[1];
      FLED1         <= leds[0];

      if (reset_w)
        cpu_reset <= data[0];

      data_data <= memory[data_address];
      program_data <= prgram[program_address];

      if (tx_w)
        BASE_UART0_txd <= data[0];

      case ({!io_read, io_address[2:0]})
        0: io_Q <= program_address;
        1: io_Q <= program_data;
        2: io_Q <= data_address;
        3: io_Q <= data_data;
        4: io_Q <= { 7'b0, serial_rx };
        5: io_Q <= { 4'b0, leds[1], 2'b0, leds[0] };
        6: io_Q <= { 7'b0, cpu_reset };
        default: io_Q <= 0;
      endcase
   end

   PLLE2_BASE #(
     .CLKFBOUT_MULT(20),
     .CLKIN1_PERIOD(10),
     .CLKOUT0_DIVIDE(6),
     .CLKOUT1_DIVIDE(60),
     .BANDWIDTH("LOW")
     ) pll (.CLKIN1(sys_clk_i_0), .CLKOUT0(cpu_clk), .CLKOUT1(io_clk),
            .CLKFBOUT(pllfb), .CLKFBIN(pllfb), .PWRDWN(0), .RST(0));

endmodule
