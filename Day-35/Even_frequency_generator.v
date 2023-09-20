module EvenFrequencyGenerator(
    input wire clk,           // Clock input
    input wire rst,           // Reset input
    output wire even_freq_out // Even-frequency output
);

reg [15:0] count;            // 16-bit counter for dividing frequency
wire toggle;                 // Signal to toggle the output

assign toggle = count[15];   // Use the most significant bit as the toggle signal

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;          // Reset the counter on reset
    end else begin
        if (count == 32767)  // Divide the clock frequency by 32768
            count <= 0;
        else
            count <= count + 1;
    end
end

assign even_freq_out = toggle;

endmodule
