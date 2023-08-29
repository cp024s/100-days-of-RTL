`timescale 1ns / 1ns  // Set the timescale for simulation

module Testbench;

  // Declare signals for the testbench
  reg clk;              // Clock signal
  reg reset;            // Reset signal
  wire [3:0] count;     // Counter output
  
  // Instantiate the SimpleCounter module
  SimpleCounter Counter1 (
      .clk(clk),
      .reset(reset),
      .count(count)
  );
  
  // Clock generation
  always begin
    #5 clk = ~clk;  // Toggle the clock every 5 time units
  end

  // Initialize signals
  initial begin
    clk = 0;    // Initialize the clock signal to 0
    reset = 0;  // Deassert reset
    #10 reset = 1;  // Assert reset for a few clock cycles to initialize the counter
    #10 reset = 0;  // Deassert reset to start counting
    
    // Monitor the counter output
    $display("Time=%t, Count=%h", $time, count);
    
    // Simulate for 20 clock cycles
    #100 $finish;  // End the simulation after 100 time units
  end

endmodule
