`timescale 1ns / 1ns  // Set timescale for simulation

module testbench_SIPO_Shift_Register();

  // Define signals for the testbench
  reg clock;
  reg reset;
  reg serial_in;
  wire [7:0] parallel_out;

  // Instantiate the SIPO shift register module
  SIPO_Shift_Register uut (
    .clock(clock),
    .reset(reset),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
  );

  // Clock generation
  always begin
    clock = 0;
    #5;  // 5ns clock cycle
    clock = 1;
    #5;
  end

  // Stimulus generation
  initial begin
    reset = 1;  // Reset initially
    serial_in = 0;

    // Apply reset
    #10;
    reset = 0;
    
    // Apply serial data and observe parallel output
    serial_in = 1;
    #10;
    assert(parallel_out === 8'b00000001) // Check parallel output
      else $display("Test failed!");

    serial_in = 0;
    #10;
    assert(parallel_out === 8'b00000000) // Check parallel output
      else $display("Test failed!");

    // Add more test cases here as needed

    $display("All tests passed!");
    $finish;
  end

endmodule
