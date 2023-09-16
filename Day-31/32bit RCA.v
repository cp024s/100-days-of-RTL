`timescale 1ns / 1ps

module source (
    input [31:0] A,   // 32-bit input A
    input [31:0] B,   // 32-bit input B
    output [31:0] sum, // 32-bit sum output
    output carry_out   // Carry out
);

wire [31:0] carry;
wire [31:0] sum_intermediate;

// Instantiate 32 full adders
genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin : gen_full_adders
        full_adder FA (
            .A(A[i]),
            .B(B[i]),
            .Ci(carry[i]),
            .S(sum_intermediate[i]),
            .Co(carry[i+1])
        );
    end
endgenerate

assign sum = sum_intermediate;
assign carry_out = carry[32];

endmodule

module full_adder (
    input A,
    input B,
    input Ci,
    output S,
    output Co
);

assign S = A ^ B ^ Ci;
assign Co = (A & B) | (Ci & (A ^ B));

endmodule
