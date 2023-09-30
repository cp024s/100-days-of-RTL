module tb_prime_checker;

  // Inputs
  reg [31:0] num;
  reg clk, rst;

  // Outputs
  wire is_prime;

  // Instantiate the Prime Checker module
  PrimeChecker prime_checker (
    .num(num),
    .is_prime(is_prime)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initialize
  initial begin
    clk = 0;
    rst = 0;
    num = 0;

    // Test cases
    // Case 1: Prime number (7)
    num = 7;
    rst = 1;
    #10;
    rst = 0;
    #10;
    if (is_prime)
      $display("Test Case 1: Passed (7 is prime)");
    else
      $display("Test Case 1: Failed (7 is prime)");

    // Case 2: Non-prime number (4)
    num = 4;
    rst = 1;
    #10;
    rst = 0;
    #10;
    if (!is_prime)
      $display("Test Case 2: Passed (4 is not prime)");
    else
      $display("Test Case 2: Failed (4 is not prime)");

    // Add more test cases here

    $finish;
  end

endmodule
