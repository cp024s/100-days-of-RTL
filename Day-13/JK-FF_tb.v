module tb_jk_flip_flop;

  // Inputs and outputs
  reg J, K, clock, reset;
  wire Q, Qbar;

  // Instantiate the JK flip-flop module
  jk_flip_flop jk_ff (
    .J(J),
    .K(K),
    .clock(clock),
    .reset(reset),
    .Q(Q),
    .Qbar(Qbar)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Initializations
  initial begin
    // Initialize inputs
    J = 0;
    K = 0;
    clock = 0;
    reset = 0;

    // Apply reset
    reset = 1;
    #10 reset = 0;

    // Test case 1: Set the flip-flop
    J = 1;
    K = 0;
    #20 $display("Test case 1: Set the flip-flop");
    #10 J = 0;

    // Test case 2: Reset the flip-flop
    J = 0;
    K = 1;
    #20 $display("Test case 2: Reset the flip-flop");
    #10 K = 0;

    // Test case 3: Toggle the flip-flop
    J = 1;
    K = 1;
    #20 $display("Test case 3: Toggle the flip-flop");
    #10 J = 0;
    #10 K = 0;

    // Finish simulation
    $finish;
  end

  // Monitor the signals
  always begin
    $display("Time=%t J=%b K=%b Q=%b Qbar=%b", $time, J, K, Q, Qbar);
  end

endmodule
