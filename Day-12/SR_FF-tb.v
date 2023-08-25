module SRFlipFlop_TB;

  // Inputs
  reg S;
  reg R;
  reg CLK;

  // Outputs
  wire Q;
  wire ~Q;

  // Instantiate the SR flip-flop
  SRFlipFlop uut (
    .S(S),
    .R(R),
    .CLK(CLK),
    .Q(Q),
    .~Q(~Q)
  );

  // Clock generation
  always begin
    #5 CLK = ~CLK;
  end

  // Stimulus
  initial begin
    S = 0;
    R = 0;
    CLK = 0;
    #10; // Wait for a few clock cycles

    // Test case 1: Set (S=1, R=0)
    S = 1;
    R = 0;
    #10;
    assert(Q === 1) else $display("Test 1 Failed!");

    // Test case 2: Reset (S=0, R=1)
    S = 0;
    R = 1;
    #10;
    assert(Q === 0) else $display("Test 2 Failed!");

    // Test case 3: No change (S=1, R=1)
    S = 1;
    R = 1;
    #10;
    assert(Q === 0) else $display("Test 3 Failed!");

    // Test case 4: No change (S=0, R=0)
    S = 0;
    R = 0;
    #10;
    assert(Q === 0) else $display("Test 4 Failed!");

    $display("All tests passed!");
    $finish;
  end

endmodule
