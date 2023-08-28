module decoder_2to4 (
    input [1:0] data_in,
    output [3:0] data_out
);

assign data_out[0] = (data_in == 2'b00) ? 1'b1 : 1'b0;
assign data_out[1] = (data_in == 2'b01) ? 1'b1 : 1'b0;
assign data_out[2] = (data_in == 2'b10) ? 1'b1 : 1'b0;
assign data_out[3] = (data_in == 2'b11) ? 1'b1 : 1'b0;

endmodule
