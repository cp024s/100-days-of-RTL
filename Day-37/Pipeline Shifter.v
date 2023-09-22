module PipelineShifter(
    input wire [7:0] data_in,
    input wire [1:0] shift_amount,
    input wire shift_right,
    output wire [7:0] data_out
);

// Define pipeline registers
reg [7:0] stage1_out, stage2_out, stage3_out;

// Stage 1: Capture input data
always @(posedge clk or posedge reset) begin
    if (reset) begin
        stage1_out <= 8'b0;
    end else begin
        stage1_out <= data_in;
    end
end

// Stage 2: Perform the shift operation
always @(posedge clk or posedge reset) begin
    if (reset) begin
        stage2_out <= 8'b0;
    end else if (shift_right) begin
        stage2_out <= stage1_out >> shift_amount;
    end else begin
        stage2_out <= stage1_out << shift_amount;
    end
end

// Stage 3: Capture the shifted data
always @(posedge clk or posedge reset) begin
    if (reset) begin
        stage3_out <= 8'b0;
    end else begin
        stage3_out <= stage2_out;
    end
end

// Output stage
assign data_out = stage3_out;

endmodule
