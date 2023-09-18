module mux_tristate(
    input wire [3:0] D,    // Data inputs
    input wire [1:0] S,    // Select input
    input wire EN,         // Enable input
    output wire Y          // Output
);
    assign Y = EN ? D[S] : 1'bz; // Tri-state buffer

endmodule
