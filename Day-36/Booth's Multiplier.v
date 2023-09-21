module booths_multiplier(
    input wire clk,
    input wire rst,
    input wire [3:0] multiplicand,
    input wire [3:0] multiplier,
    output wire [7:0] product
);

reg [7:0] accumulator;
reg [3:0] multiplier_reg;
reg [1:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        accumulator <= 8'b0;
        multiplier_reg <= 4'b0;
        count <= 2'b0;
    end else begin
        // Booth's Algorithm Implementation
        if (count == 2'b00) begin
            if (multiplier[0] == 1 && multiplier_reg[0] == 0)
                accumulator <= accumulator + multiplicand;
            else if (multiplier[0] == 0 && multiplier_reg[0] == 1)
                accumulator <= accumulator - multiplicand;
        end
        
        // Right Shift
        {multiplier_reg, multiplier[3]} <= {multiplier_reg, multiplier[3:1]};
        count <= count + 1;
    end
end

assign product = accumulator;

endmodule
