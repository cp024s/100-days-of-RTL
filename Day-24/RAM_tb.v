module RAM_4x4_tb;

  reg [1:0] address;
  reg write_enable;
  reg [3:0] data_input;
  wire [3:0] data_output;

  // Instantiate the RAM_4x4 module
  RAM_4x4 ram (
    .address(address),
    .write_enable(write_enable),
    .data_input(data_input),
    .data_output(data_output)
  );

  // Clock generation
  reg clock = 0;
  always #5 clock = ~clock;

  // Testbench stimulus
  initial begin
    // Initialize signals
    address = 2'b00;
    write_enable = 0;
    data_input = 4'b0000;

    // Write data to the RAM
    write_enable = 1;
    data_input = 4'b1101;
    address = 2'b01;
    #10; // Wait for a few clock cycles

    // Read data from the RAM
    address = 2'b01;
    write_enable = 0;
    #10; // Wait for a few clock cycles

    // Check the data output
    if (data_output === 4'b1101)
      $display("RAM Test Passed!");
    else
      $display("RAM Test Failed!");

    // Finish simulation
    $finish;
  end

  // Apply clock signal
  always begin
    #5 clock = ~clock;
  end

endmodule
