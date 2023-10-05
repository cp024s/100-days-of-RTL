module testbench_CLA_32bit;

  reg [31:0] A, B;
  wire [31:0] Sum;
  wire CarryOut;

  // Instantiate the CLA_32bit module
  CLA_32bit uut (
    .A(A),
    .B(B),
    .Sum(Sum),
    .CarryOut(CarryOut)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Stimulus generation
  initial begin
    $display("Testing 32-bit CLA Adder");
    $display("-------------------------");

    // Test Case 1: A = 0, B = 0
    A = 32'b00000000000000000000000000000000;
    B = 32'b00000000000000000000000000000000;
    #10 $display("Test Case 1: A = 0, B = 0");
    #10 if (Sum === 32'b00000000000000000000000000000000 && CarryOut === 0) $display("PASS");
    else $display("FAIL");

    // Test Case 2: A = 1, B = 0xFFFFFFFF (all 1's)
    A = 32'b00000000000000000000000000000001;
    B = 32'b11111111111111111111111111111111;
    #10 $display("Test Case 2: A = 1, B = 0xFFFFFFFF");
    #10 if (Sum === 32'b00000000000000000000000000000000 && CarryOut === 1) $display("PASS");
    else $display("FAIL");

    // Test Case 3: A = 0xFFFFFFFF (all 1's), B = 1
    A = 32'b11111111111111111111111111111111;
    B = 32'b00000000000000000000000000000001;
    #10 $display("Test Case 3: A = 0xFFFFFFFF, B = 1");
    #10 if (Sum === 32'b00000000000000000000000000000000 && CarryOut === 1) $display("PASS");
    else $display("FAIL");

    // Test Case 4: A = 0xAAAAAAAA, B = 0x55555555
    A = 32'b10101010101010101010101010101010;
    B = 32'b01010101010101010101010101010101;
    #10 $display("Test Case 4: A = 0xAAAAAAAA, B = 0x55555555");
    #10 if (Sum === 32'b11111111111111111111111111111111 && CarryOut === 0) $display("PASS");
    else $display("FAIL");

    // Test Case 5: A = 0x12345678, B = 0x87654321
    A = 32'b00010010001101000101011001111000;
    B = 32'b10000111011001010100001100100001;
    #10 $display("Test Case 5: A = 0x12345678, B = 0x87654321");
    #10 if (Sum === 32'b10011001110100011001000110011001 && CarryOut === 0) $display("PASS");
    else $display("FAIL");

    // Finish simulation
    $finish;
  end

  // Apply clock signal
  always begin
    #5 clk = ~clk;
  end

endmodule
