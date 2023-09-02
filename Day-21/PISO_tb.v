module piso_shift_register_tb;
  reg clk;               // Clock signal
  reg reset;             // Reset signal
  reg [7:0] parallel_in; // Parallel input data (8 bits)
  reg shift_enable;      // Shift enable control signal
  wire serial_out;       // Serial output

  // Instantiate the PISO shift register module
  piso_shift_register dut (
    .clk(clk),
    .reset(reset),
    .parallel_in(parallel_in),
    .shift_enable(shift_enable),
    .serial_out(serial_out)
  );

  // Clock generation
  always begin
    clk = ~clk; // Invert the clock signal
    #5;         // Toggle the clock every 5 time units
  end

  // Initial block for test stimulus
  initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    parallel_in = 8'b0;
    shift_enable = 0;

    // Apply a reset pulse
    reset = 1;
    #10;
    reset = 0;

    // Load data into the shift register
    parallel_in = 8'b10101010;
    shift_enable = 1;
    #20;
    shift_enable = 0;

    // Monitor the serial output
    $display("Serial Output: %b", serial_out);
    
    // Add more test cases as needed

    // Finish simulation
    $finish;
  end

endmodule
