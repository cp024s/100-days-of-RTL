module mux_4x1 (
    input wire [3:0] data_inputs,
    input wire [1:0] select,
    output wire mux_output
);

assign mux_output = (select == 2'b00) ? data_inputs[0] : (select == 2'b01) ? data_inputs[1] : (select == 2'b10) ? data_inputs[2] : data_inputs[3];

endmodule
