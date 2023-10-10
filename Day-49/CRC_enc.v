module crc_encoder(
    input [3:0] data_in,
    output reg [6:0] crc_out
);

reg [3:0] crc_reg;
reg [3:0] divisor = 4'b1101; // Polynomial x^3 + x^2 + 1

always @(posedge clk or posedge reset) begin
    if (reset) begin
        crc_reg <= 4'b0000;
    end else begin
        crc_reg <= {crc_reg[2:0], data_in} ^ (crc_reg[3] ? divisor : 4'b0000);
    end
end

assign crc_out = {crc_reg, data_in};

endmodule
