module testbench;

  reg clk;
  reg reset;
  wire out_A, out_B, out_C, out_D;

  // Instantiate the MooreMachine module
  MooreMachine uut (
    .clk(clk),
    .reset(reset),
    .out_A(out_A),
    .out_B(out_B),
    .out_C(out_C),
    .out_D(out_D)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initialize signals
  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
  end

  // Stimulus generation
  initial begin
    // Apply a sequence of inputs to test the Moore machine
    // You can modify this sequence based on your requirements
    $display("Time reset state out_A out_B out_C out_D");
    $monitor("%d %d %h %h %h %h %h", $time, reset, uut.state, out_A, out_B, out_C, out_D);

    // Initial state (reset)
    #10 reset = 1;

    // Transition from S0 to S1
    #10 reset = 0;

    // Transition from S1 to S2
    #10 reset = 0;

    // Transition from S2 to S3
    #10 reset = 0;

    // Transition from S3 back to S0
    #10 reset = 0;

    // Repeat the sequence or add more test cases as needed

    // Finish the simulation after a while
    #10 $finish;
  end

endmodule
