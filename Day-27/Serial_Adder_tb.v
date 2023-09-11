
module testbench();

  // Inputs
  reg clk;       // Clock signal
  reg reset;     // Reset signal
  reg A;         // Input bit A
  reg B;         // Input bit B
  reg cin;       // Carry input bit
  
  // Outputs
  wire sum;      // Sum output bit
  wire cout;     // Carry output bit

  // Instantiate the serial adder module
  serial_adder adder (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  // Clock generation
  always begin
    clk = 0;
    #5; // 5 time units low
    clk = 1;
    #5; // 5 time units high
  end

  // Initial values
  initial begin
    // Initialize inputs
    reset = 0;
    A = 0;
    B = 0;
    cin = 0;

    // Apply reset and inputs
    reset = 1;
    #10; // Assert reset for 10 time units
    reset = 0;

    // Test cases
    // You can add more test cases here by changing the inputs A, B, and cin.
    A = 0;
    B = 0;
    cin = 0;
    #10; // Allow some time for calculation
    // You can add assertions to check the expected results here.

    // Repeat with different inputs and test cases

    $finish; // Finish simulation
  end

endmodule
