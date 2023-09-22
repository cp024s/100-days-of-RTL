module Testbench;

  // Define signals
  reg [7:0] data_in;
  reg [1:0] shift_amount;
  reg shift_right;
  wire [7:0] data_out;

  // Instantiate the pipeline shifter
  PipelineShifter UUT (
    .data_in(data_in),
    .shift_amount(shift_amount),
    .shift_right(shift_right),
    .data_out(data_out)
  );

  // Clock generation
  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  // Reset generation
  reg rst = 0;
  initial begin
    rst = 1;
    #10 rst = 0;
    // Test all possible combinations
    for (shift_right = 0; shift_right <= 1; shift_right = shift_right + 1) begin
      for (shift_amount = 0; shift_amount <= 3; shift_amount = shift_amount + 1) begin
        for (data_in = 0; data_in <= 255; data_in = data_in + 1) begin
          #10;
          // Display results
          $display("Input: %h, Shift Amount: %h, Shift Right: %b, Output: %h", data_in, shift_amount, shift_right, data_out);
        end
      end
    end
    $finish;
  end

  // Apply clock and reset
  always begin
    #5 clk = ~clk;
  end

  always begin
    #5 clk = ~clk;
  end

endmodule
