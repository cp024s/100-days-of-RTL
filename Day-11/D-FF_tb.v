module testbench;

  // Define constants
  reg d;      // Data input
  reg clk;    // Clock input
  reg rst;    // Reset input
  wire q;     // Output
  
  // Instantiate the D flip-flop
  d_flip_flop DUT (
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  always begin
    clk = 0;
    #5; // 5 time units low
    clk = 1;
    #5; // 5 time units high
  end

  // Stimulus generation and simulation
  initial begin
    // Initialize inputs
    d = 0;
    rst = 0;

    // Apply reset
    rst = 1;
    #10; // Hold reset for 10 time units

    // Release reset and apply data
    rst = 0;
    d = 1;
    #10; // Wait for 10 time units

    // Change data value
    d = 0;
    #10; // Wait for 10 time units

    // Apply reset again
    rst = 1;
    #10; // Hold reset for 10 time units

    // Release reset and apply data
    rst = 0;
    d = 1;
    #10; // Wait for 10 time units

    // End simulation
    $finish;
  end

  // Display output
  always @(posedge clk) begin
    $display("Time=%0t, d=%b, clk=%b, rst=%b, q=%b", $time, d, clk, rst, q);
  end

endmodule
