module RingCounter (
    input wire clk,     // Clock input
    input wire rst,     // Reset input
    output wire [3:0] out  // 4-bit output
);

reg [3:0] counter; // 4-bit counter register

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 4'b0001; // Initialize to 0001 on reset
    end else begin
        counter <= counter << 1; // Shift the '1' bit left
        counter[0] <= counter[3]; // Connect MSB to LSB to create the ring effect
    end
end

assign out = counter;

endmodule
