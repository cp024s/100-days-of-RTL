module tb_crc_encoder;

reg clk;
reg reset;
reg [3:0] data_in;
wire [6:0] crc_out;

// Instantiate the CRC Encoder module
crc_encoder crc_inst (
    .data_in(data_in),
    .crc_out(crc_out)
);

// Clock generation
always begin
    #5 clk = ~clk; // Create a clock signal with a period of 10 time units
end

// Test input sequences
initial begin
    clk = 0;
    reset = 0;

    // Test Case 1: Input 4-bit data '1010'
    data_in = 4'b1010;
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Input Data = %b, CRC Output = %b", $time, data_in, crc_out);

    // Test Case 2: Input 4-bit data '1101'
    data_in = 4'b1101;
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Input Data = %b, CRC Output = %b", $time, data_in, crc_out);

    // Test Case 3: Input 4-bit data '0011'
    data_in = 4'b0011;
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Input Data = %b, CRC Output = %b", $time, data_in, crc_out);

    // Test Case 4: Input 4-bit data '1111'
    data_in = 4'b1111;
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Input Data = %b, CRC Output = %b", $time, data_in, crc_out);

    // Test Case 5: Input 4-bit data '0100'
    data_in = 4'b0100;
    reset = 1;
    #10 reset = 0;
    $display("Time = %0t: Input Data = %b, CRC Output = %b", $time, data_in, crc_out);

    // Finish the simulation after a few clock cycles
    #100;
    $finish;
end

endmodule
