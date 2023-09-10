module tb_two_port_ram;
  reg clk;
  reg rst;
  reg [7:0] addr1;
  reg [7:0] addr2;
  reg [7:0] data_in1;
  reg [7:0] data_in2;
  reg write_en1;
  reg write_en2;
  wire [7:0] data_out1;
  wire [7:0] data_out2;

  // Instantiate the two-port RAM module
  two_port_ram uut (
    .clk(clk),
    .rst(rst),
    .addr1(addr1),
    .addr2(addr2),
    .data_in1(data_in1),
    .data_in2(data_in2),
    .write_en1(write_en1),
    .write_en2(write_en2),
    .data_out1(data_out1),
    .data_out2(data_out2)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initial values
  initial begin
    clk = 0;
    rst = 0;
    addr1 = 8'b0;
    addr2 = 8'b0;
    data_in1 = 8'b0;
    data_in2 = 8'b0;
    write_en1 = 0;
    write_en2 = 0;

    // Test Case 1: Read from an empty memory location
    addr1 = 8'b00000000; // Empty memory location
    addr2 = 8'b00000005; // Non-empty memory location
    write_en1 = 0;
    write_en2 = 0;
    #10;

    // Test Case 2: Write data to the same memory location from both ports simultaneously
    addr1 = 8'b00000002; // Memory location
    addr2 = 8'b00000002; // Same memory location
    data_in1 = 8'b11001100;
    data_in2 = 8'b10101010;
    write_en1 = 1;
    write_en2 = 1;
    #10 write_en1 = 0;
    #10 write_en2 = 0;

    // Test Case 3: Simultaneous read and write operations from different ports
    addr1 = 8'b00000003; // Memory location for read
    addr2 = 8'b00000004; // Memory location for write
    data_in1 = 8'b00000000; // Data to write
    data_in2 = 8'b11111111; // Data to read
    write_en1 = 1;
    write_en2 = 0;
    #10 write_en1 = 0;
    #10;

    // Test Case 4: Verify reading data while a write operation is in progress
    addr1 = 8'b00000006; // Memory location for read
    addr2 = 8'b00000007; // Memory location for write
    data_in1 = 8'b00000000; // Data to write
    data_in2 = 8'b11111111; // Data to read
    write_en1 = 1;
    write_en2 = 1;
    #5;
    write_en1 = 0;
    #10;

    // Test Case 5: Test behavior when both write_en1 and write_en2 are active simultaneously
    addr1 = 8'b00000008; // Memory location
    addr2 = 8'b00000009; // Memory location
    data_in1 = 8'b11001100;
    data_in2 = 8'b10101010;
    write_en1 = 1;
    write_en2 = 1;
    #10;

    // Test Case 6: Test behavior when both ports access the same memory location with different data values
    addr1 = 8'b0000000A; // Memory location
    addr2 = 8'b0000000A; // Same memory location
    data_in1 = 8'b11001100;
    data_in2 = 8'b10101010;
    write_en1 = 1;
    write_en2 = 1;
    #10;

    // Test Case 7: Verify the functionality when the reset signal (rst) is asserted at different times during operation
    addr1 = 8'b0000000B; // Memory location
    addr2 = 8'b0000000C; // Memory location
    data_in1 = 8'b11001100;
    data_in2 = 8'b10101010;
    write_en1 = 1;
    write_en2 = 1;
    rst = 1;
    #5 rst = 0;
    #10 write_en1 = 0;
    #10 write_en2 = 0;

    // Finish simulation
    $finish;
  end

  // Display results
  initial begin
    $display("Time=%0t addr1=%h data_out1=%h addr2=%h data_out2=%h", $time, addr1, data_out1, addr2, data_out2);
  end

endmodule
