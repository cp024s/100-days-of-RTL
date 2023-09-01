module UpDownCounter (
    input wire clk,         // Clock input
    input wire rst,         // Reset input
    input wire up_down,    // Up/Down control input
    output reg [3:0] count // 4-bit counter output
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000; // Reset the counter to 0
    end else if (up_down) begin
        // Count up
        if (count < 4'b1111) begin
            count <= count + 1;
        end
    end else begin
        // Count down
        if (count > 4'b0000) begin
            count <= count - 1;
        end
    end
end

endmodule
