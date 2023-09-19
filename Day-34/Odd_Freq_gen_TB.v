module odd_frequency_generator (
    input wire clk,       // Clock input
    input wire rst,       // Reset input
    output wire out       // Output frequency signal
);

reg [31:0] counter;      // 32-bit counter to keep track of cycles

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;    // Reset the counter on reset signal
    end else begin
        if (counter == (odd_number - 1)) begin
            counter <= 0; // Reset the counter when it reaches the odd_number - 1
            out <= ~out;  // Toggle the output signal to generate the frequency
        end else begin
            counter <= counter + 1; // Increment the counter
        end
    end
end

initial begin
    counter <= 0;
    out <= 0;
end

endmodule
