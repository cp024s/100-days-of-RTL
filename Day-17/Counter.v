module SimpleCounter (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    output wire [3:0] count  // 4-bit output representing the count value
);

reg [3:0] count;  // 4-bit register to hold the current count value

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0000;  // When reset is asserted, reset the count to 0
    else
        count <= count + 1;  // Increment the count on each rising clock edge
end

assign count = count;  // Continuous assignment of count to the output

endmodule
