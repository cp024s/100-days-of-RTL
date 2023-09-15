module PriorityEncoder8to3 (
    input wire enable,
    input wire clear,
    input wire [7:0] inputs,
    output wire [2:0] output
);

reg [2:0] encoded_output;

always @(inputs or enable or clear) begin
    if (clear) begin
        encoded_output <= 3'b000;
    end else if (enable) begin
        case (inputs)
            8'b10000000: encoded_output <= 3'b000; // Lowest priority
            8'b01000000: encoded_output <= 3'b001;
            8'b00100000: encoded_output <= 3'b010;
            8'b00010000: encoded_output <= 3'b011;
            8'b00001000: encoded_output <= 3'b100;
            8'b00000100: encoded_output <= 3'b101;
            8'b00000010: encoded_output <= 3'b110;
            8'b00000001: encoded_output <= 3'b111; // Highest priority
            default:       encoded_output <= 3'b000; // No active input
        endcase
    end
end

assign output = encoded_output;

endmodule
