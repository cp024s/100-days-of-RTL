module NumberSystemConverter(
    input [3:0] inputValue, // 4-bit input value
    output [7:0] binaryOutput,
    output [7:0] decimalOutput,
    output [7:0] octalOutput,
    output [7:0] hexadecimalOutput
);

assign binaryOutput = inputValue; // Binary conversion is a direct copy
assign decimalOutput = 4'd0; // Initialize the decimal output
assign octalOutput = 4'd0; // Initialize the octal output
assign hexadecimalOutput = 4'd0; // Initialize the hexadecimal output

always @* begin
    // Binary to Decimal Conversion
    decimalOutput = inputValue;

    // Binary to Octal Conversion
    case(inputValue)
        4'b0000: octalOutput = 4'd0;
        4'b0001: octalOutput = 4'd1;
        4'b0010: octalOutput = 4'd2;
        4'b0011: octalOutput = 4'd3;
        4'b0100: octalOutput = 4'd4;
        4'b0101: octalOutput = 4'd5;
        4'b0110: octalOutput = 4'd6;
        4'b0111: octalOutput = 4'd7;
        4'b1000: octalOutput = 4'd10;
        4'b1001: octalOutput = 4'd11;
        4'b1010: octalOutput = 4'd12;
        4'b1011: octalOutput = 4'd13;
        4'b1100: octalOutput = 4'd14;
        4'b1101: octalOutput = 4'd15;
        4'b1110: octalOutput = 4'd16;
        4'b1111: octalOutput = 4'd17;
        default: octalOutput = 4'd0;
    endcase

    // Binary to Hexadecimal Conversion
    case(inputValue)
        4'b0000: hexadecimalOutput = 4'h0;
        4'b0001: hexadecimalOutput = 4'h1;
        4'b0010: hexadecimalOutput = 4'h2;
        4'b0011: hexadecimalOutput = 4'h3;
        4'b0100: hexadecimalOutput = 4'h4;
        4'b0101: hexadecimalOutput = 4'h5;
        4'b0110: hexadecimalOutput = 4'h6;
        4'b0111: hexadecimalOutput = 4'h7;
        4'b1000: hexadecimalOutput = 4'h8;
        4'b1001: hexadecimalOutput = 4'h9;
        4'b1010: hexadecimalOutput = 4'ha;
        4'b1011: hexadecimalOutput = 4'hb;
        4'b1100: hexadecimalOutput = 4'hc;
        4'b1101: hexadecimalOutput = 4'hd;
        4'b1110: hexadecimalOutput = 4'he;
        4'b1111: hexadecimalOutput = 4'hf;
        default: hexadecimalOutput = 4'h0;
    endcase
end

endmodule
