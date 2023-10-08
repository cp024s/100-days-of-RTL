module SequenceDetector_tb;

  reg clk;
  reg reset;
  reg data_in;
  wire detected;

  // Instantiate the SequenceDetector module
  SequenceDetector dut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .detected(detected)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Test cases
  initial begin
    clk = 0;
    reset = 1;
    data_in = 0;
    #10 reset = 0; // Release reset

    // Test case 1: No sequence
    data_in = 0;
    #50;

    // Test case 2: Detect "101"
    data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #50;

    // Test case 3: No sequence
    data_in = 1;
    #50;

    // Test case 4: Detect "101"
    data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #50;

    // Test case 5: Detect "101" twice in a row
    data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #50;

    // Test case 6: Detect "101" with a reset in between
    reset = 1;
    #10 reset = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #50;

    // Test case 7: Detect "101" with a reset in between
    reset = 1;
    #10 reset = 0;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #50;

    // Test case 8: No sequence
    data_in = 0;
    #50;

    // Test case 9: Detect "101"
    data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #50;

    // Test case 10: No sequence
    data_in = 1;
    #50;

    $finish;
  end

endmodule
