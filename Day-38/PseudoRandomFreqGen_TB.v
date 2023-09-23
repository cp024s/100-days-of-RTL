module tb_lfsr4bit;

  // Inputs
  reg clk;
  reg rst;

  // Outputs
  wire [3:0] rand_out;

  // Instantiate the 4-bit LFSR module
  lfsr4bit uut (
    .clk(clk),
    .rst(rst),
    .rand_out(rand_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Generate a clock signal with a period of 10 time units
  end

  // Testbench stimulus
  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0; // Release the reset after 10 time units

    // Test all possible input combinations
    for (int i = 0; i < 16; i = i + 1) begin
      rst = 1'b1 & i[0];
      // Apply the other 3 bits of input
      // Note: You can use 'i[1]' for bit 1, 'i[2]' for bit 2, and 'i[3]' for bit 3
      // Connect them to your design inputs as needed
      #20; // Wait for a few clock cycles for the output to settle
    end

    // End simulation
    $finish;
  end

endmodule
