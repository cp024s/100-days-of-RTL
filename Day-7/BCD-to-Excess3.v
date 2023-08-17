module bcd_to_excess3 (
    input wire [3:0] bcd_in,
    output wire [3:0] xs3_out
);

    wire [3:0] bcd_plus_3; // BCD input + 3

    assign bcd_plus_3 = bcd_in + 4'b0011; // Increment BCD by 3

    // XS-3 output is same as incremented BCD output
    assign xs3_out = bcd_plus_3;

endmodule
