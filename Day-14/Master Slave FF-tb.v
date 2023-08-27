module testbench;

  // Parameters
  parameter PERIOD = 10;  // Clock period in time units
  parameter HALF_PERIOD = PERIOD / 2;

  // Signals
  reg clk;                // Clock signal
  reg rst;                // Reset signal
  reg d;                  // Data input
  wire q;                 // Output

  // Instantiate the Master-Slave Flip-Flop module
  master_slave_flip_flop uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
  );

  // Clock generation
  always begin
    #HALF_PERIOD clk = ~clk; // Generate a clock signal with a 50% duty cycle
  end

  // Initial values
  initial begin
    clk = 0;
    rst = 0;
    d = 0;
    
    // Apply reset and data
    #PERIOD rst = 1;
    #PERIOD rst = 0;
    #PERIOD d = 1;
    #PERIOD d = 0;
    
    // Monitor the output q
    $monitor("Time = %0t, clk = %b, rst = %b, d = %b, q = %b", $time, clk, rst, d, q);
    
    // Stop simulation after a specific time
    #200 $finish;
  end

endmodule
