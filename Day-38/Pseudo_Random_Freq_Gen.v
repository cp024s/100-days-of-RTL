module lfsr4bit (
    input wire clk,      // Clock input
    input wire rst,      // Reset input
    output wire [3:0] rand_out // 4-bit pseudo-random output
);

reg [3:0] lfsr; // 4-bit shift register

always @(posedge clk or posedge rst) begin
    if (rst) begin
        lfsr <= 4'b0001; // Initialize with a non-zero seed
    end else begin
        // LFSR feedback connections for a 4-bit LFSR
        lfsr[0] <= lfsr[3] ^ lfsr[2];
        lfsr[1] <= lfsr[0];
        lfsr[2] <= lfsr[1];
        lfsr[3] <= lfsr[2];
    end
end

assign rand_out = lfsr;

endmodule
