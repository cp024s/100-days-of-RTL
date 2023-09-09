module testbench;

  // Declare signals for the testbench
  reg [7:0] data_in;
  reg [2:0] shift_amount;
  reg shift_direction;
  wire [7:0] data_out;

  // Instantiate the parallel shifter module
  ParallelShifter shifter (
    .data_in(data_in),
    .shift_amount(shift_amount),
    .shift_direction(shift_direction),
    .data_out(data_out)
  );

  // Initialize the signals
  initial begin
    // Test case 1: Left shift by 2 positions
    data_in = 8'b11001100;
    shift_amount = 3'b010;
    shift_direction = 1'b0;
    #10;  // Wait for some time to observe the output
    if (data_out !== 8'b00110000) $display("Test case 1 failed");
    else $display("Test case 1 passed");

    // Test case 2: Right shift by 3 positions
    data_in = 8'b11001100;
    shift_amount = 3'b011;
    shift_direction = 1'b1;
    #10;  // Wait for some time to observe the output
    if (data_out !== 8'b00011001) $display("Test case 2 failed");
    else $display("Test case 2 passed");

    // Add more test cases as needed

    // Terminate simulation
    $finish;
  end

endmodule
