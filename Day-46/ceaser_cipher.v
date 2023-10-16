module caesar_cipher (
    input wire [7:0] plaintext, // 8-bit ASCII character
    input wire [3:0] shift,     // 4-bit shift value
    output wire [7:0] ciphertext
);

    // Declare internal signals
    wire [7:0] shifted_char;

    always @(*) begin
        // Implement the Caesar cipher logic
        shifted_char = plaintext + shift;

        if (shifted_char > 127) begin
            shifted_char = shifted_char - 26;
        end

        ciphertext = shifted_char;
    end

endmodule
