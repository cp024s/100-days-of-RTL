`timescale 1ns/1ps

module tb_fifo;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Signals
  reg clk = 0;              // Clock signal
  reg rst = 0;              // Reset signal
  reg wr_en = 0;            // Write enable signal
  reg rd_en = 0;            // Read enable signal
  reg [7:0] data_in = 8'h00; // Data input
  wire [7:0] data_out;      // Data output

  // Instantiate the FIFO module
  fifo my_fifo (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  always begin
    #CLK_PERIOD / 2 clk = ~clk;
  end

  // Test sequence
  initial begin
    // Reset and initialize
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 8'h00;
    #20 rst = 0;
    #20;

    // Write data into the FIFO
    wr_en = 1;
    data_in = 8'h01;
    #20;

    wr_en = 1;
    data_in = 8'h02;
    #20;

    wr_en = 1;
    data_in = 8'h03;
    #20;

    wr_en = 1;
    data_in = 8'h04;
    #20;

    // Read data from the FIFO
    rd_en = 1;
    #20;

    rd_en = 1;
    #20;

    rd_en = 1;
    #20;

    rd_en = 1;
    #20;

    // More test cases can be added here to cover various scenarios

    $stop;
  end

endmodule
