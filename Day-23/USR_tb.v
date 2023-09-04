module Universal_Shift_Register_TB;

  // Define constants
  reg clk;
  reg reset;
  reg load;
  reg shift_left;
  reg shift_right;
  reg serial_in;
  reg enable;
  wire [3:0] q;

  // Instantiate the universal shift register
  Universal_Shift_Register uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .shift_left(shift_left),
    .shift_right(shift_right),
    .serial_in(serial_in),
    .enable(enable),
    .q(q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Test sequence
  initial begin
    clk = 0;
    reset = 0;
    load = 0;
    shift_left = 0;
    shift_right = 0;
    serial_in = 0;
    enable = 1;

    // Reset the universal shift register
    reset = 1;
    #10 reset = 0;

    // Load data into the register
    load = 1;
    serial_in = 4'b1101; // Load data 1101
    #10 load = 0;

    // Perform left shift
    shift_left = 1;
    #10 shift_left = 0;

    // Perform right shift
    shift_right = 1;
    #10 shift_right = 0;

    // Observe the output
    $display("q = %b", q);

    // Finish the simulation
    $finish;
  end

endmodule
