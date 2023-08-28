module encoder_4to2 (
    input [3:0] data_in,
    output [1:0] data_out
);

assign data_out[0] = |data_in[3:2];
assign data_out[1] = |data_in[1:0];

endmodule
