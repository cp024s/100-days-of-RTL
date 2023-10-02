module palindrome_checker_tb;

  reg [7:0] data_in;
  wire is_palindrome;

  // Instantiate the palindrome checker module
  palindrome_checker uut (
    .data_in(data_in),
    .is_palindrome(is_palindrome)
  );

  // Clock generation
  reg clock = 0;
  always #5 clock = ~clock;

  // Stimulus generation
  initial begin
    $display("Time\tData In\tIs Palindrome");
    $monitor("%d\t%b\t%d", $time, data_in, is_palindrome);

    // Test case 1: Non-palindrome data
    data_in = 8'b11011010;
    #10;

    // Test case 2: Palindrome data
    data_in = 8'b10101101;
    #10;

    // Test case 3: Non-palindrome data
    data_in = 8'b11110000;
    #10;

    // Terminate simulation
    $finish;
  end

  // Clock generation
  always begin
    #2 clock = ~clock;
  end

endmodule
