module mux_8x1 (
    input wire [7:0] data_inputs,
    input wire [2:0] select,
    output wire mux_output
);

wire [3:0] mux1_output;

mux_4x1 mux1 (
    .data_inputs(data_inputs[3:0]),
    .select(select[1:0]),
    .mux_output(mux1_output)
);

mux_4x1 mux2 (
    .data_inputs(data_inputs[7:4]),
    .select(select[1:0]),
    .mux_output(mux_output)
);

assign mux_output = (select[2] == 1'b0) ? mux1_output : data_inputs[7:4];

endmodule
