module tb_crc_decoder;

reg clk;
reg reset;
wire [6:0] received_data;
wire valid;

// Instantiate the CRC Decoder module
crc_decoder decoder_inst (
    .received_data(received_data),
    .valid(valid)
);

// Clock generation
always begin
    #5 clk = ~clk; // Create a clock signal with a period of 10 time units
end

// Test input sequences
initial begin
    clk = 0;
    reset = 0;

    // Test Case 1: Valid data (CRC check passes)
    received_data = 7'b1010100; // 4-bit data '1010' with CRC '100'
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Received Data = %b, Valid = %b", $time, received_data, valid);

    // Test Case 2: Invalid data (CRC check fails)
    received_data = 7'b1010111; // 4-bit data '1010' with CRC '111'
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Received Data = %b, Valid = %b", $time, received_data, valid);

    // Test Case 3: Valid data (CRC check passes)
    received_data = 7'b1101010; // 4-bit data '1101' with CRC '010'
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Received Data = %b, Valid = %b", $time, received_data, valid);

    // Test Case 4: Invalid data (CRC check fails)
    received_data = 7'b0011111; // 4-bit data '0011' with CRC '111'
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Received Data = %b, Valid = %b", $time, received_data, valid);

    // Test Case 5: Valid data (CRC check passes)
    received_data = 7'b1111000; // 4-bit data '1111' with CRC '000'
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Received Data = %b, Valid = %b", $time, received_data, valid);

    // Finish the simulation after a few clock cycles
    #100;
    $finish;
end

endmodule
