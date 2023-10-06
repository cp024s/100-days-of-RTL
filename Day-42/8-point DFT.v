module ButterflyUnit8 (
    input wire [15:0] input_real[7:0],  // Real parts of inputs A, B, C, D, E, F, G, H
    input wire [15:0] input_imag[7:0],  // Imaginary parts of inputs A, B, C, D, E, F, G, H
    input wire control_signal[2:0],     // Control signal to select operation (3-bit value)
    output wire [15:0] output_real[7:0], // Real parts of outputs X, Y, Z, W, P, Q, R, S
    output wire [15:0] output_imag[7:0]  // Imaginary parts of outputs X, Y, Z, W, P, Q, R, S
);

    wire [15:0] temp_real[7:0], temp_imag[7:0];

    // Butterfly operations for each pair of inputs
    generate
        genvar i;
        for (i = 0; i < 8; i = i + 1) begin : butterfly_stage
            assign temp_real[i] = (control_signal[2:0] == 3'b000) ? (input_real[i] + input_real[i ^ (1 << 0)]) : (input_real[i] - input_real[i ^ (1 << 0)]);
            assign temp_imag[i] = (control_signal[2:0] == 3'b000) ? (input_imag[i] + input_imag[i ^ (1 << 0)]) : (input_imag[i] - input_imag[i ^ (1 << 0)]);
        end
    endgenerate

    // Output the results
    assign output_real = temp_real;
    assign output_imag = temp_imag;

endmodule
