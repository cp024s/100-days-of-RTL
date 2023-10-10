module crc_decoder(
    input [6:0] received_data, // 7 bits: 4-bit data + 3-bit CRC
    output reg valid
);

reg [3:0] crc_reg;
reg [3:0] divisor = 4'b1101; // Polynomial x^3 + x^2 + 1

always @(posedge clk or posedge reset) begin
    if (reset) begin
        crc_reg <= 4'b0000;
    end else begin
        crc_reg <= {crc_reg[2:0], received_data[6:4]} ^ (crc_reg[3] ? divisor : 4'b0000);
    end
end

assign valid = (crc_reg == 4'b0000);

endmodule  
