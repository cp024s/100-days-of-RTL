module Bin_to_Gray (
    input [3:0] binary,
    output [3:0] gray
);

    assign gray[0] = binary[0] ^ binary[1];
    assign gray[1] = binary[1] ^ binary[2];
    assign gray[2] = binary[2] ^ binary[3];
    assign gray[3] = binary[3];

endmodule
