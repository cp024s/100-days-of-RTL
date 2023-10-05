module CLA_32bit (
    input [31:0] A,       // 32-bit input A
    input [31:0] B,       // 32-bit input B
    output [31:0] Sum,   // 32-bit sum output
    output CarryOut      // Carry out
);

wire [31:0] G, P, C;

// Generate and Propagate signals
generate
    genvar i;
    for (i = 0; i < 32; i = i + 1) begin
        and and_G (
            .a(A[i]),
            .b(B[i]),
            .z(G[i])
        );

        or or_P (
            .a(A[i]),
            .b(B[i]),
            .z(P[i])
        );
    end
endgenerate

// Carry Look-Ahead Logic
generate
    genvar i;
    for (i = 0; i < 32; i = i + 1) begin
        assign G[i] = A[i] & B[i];
        assign P[i] = A[i] | B[i];
    end
endgenerate

// Carry chain
assign C[0] = 1'b0;
generate
    genvar i;
    for (i = 1; i < 32; i = i + 1) begin
        assign C[i] = (P[i-1] & C[i-1]) | G[i-1];
    end
endgenerate

// Sum output
generate
    genvar i;
    for (i = 0; i < 32; i = i + 1) begin
        assign Sum[i] = A[i] ^ B[i] ^ C[i];
    end
endgenerate

// Carry out
assign CarryOut = C[31];

endmodule
