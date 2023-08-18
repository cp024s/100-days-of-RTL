module mux_2x1 (
    input wire data0,
    input wire data1,
    input wire select,
    output wire mux_output
);

assign mux_output = (select == 1'b0) ? data0 : data1;

endmodule

module mux_4x1_using_2x1 (
    input wire [3:0] data_inputs,
    input wire [1:0] select,
    output wire mux_output
);

wire [1:0] intermediate_select;

mux_2x1 mux0 (.data0(data_inputs[0]), .data1(data_inputs[1]), .select(select[0]), .mux_output(mux_output[0]));
mux_2x1 mux1 (.data0(data_inputs[2]), .data1(data_inputs[3]), .select(select[0]), .mux_output(mux_output[1]));

mux_2x1 final_mux (.data0(mux_output[0]), .data1(mux_output[1]), .select(select[1]), .mux_output(mux_output));

endmodule
