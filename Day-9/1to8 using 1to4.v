module demux_1to4 (
    input wire enable,
    input wire [1:0] select,
    output wire out0,
    output wire out1,
    output wire out2,
    output wire out3
);

assign out0 = (enable && (select == 2'b00)) ? 1'b1 : 1'b0;
assign out1 = (enable && (select == 2'b01)) ? 1'b1 : 1'b0;
assign out2 = (enable && (select == 2'b10)) ? 1'b1 : 1'b0;
assign out3 = (enable && (select == 2'b11)) ? 1'b1 : 1'b0;

endmodule

module demux_1to8 (
    input wire enable,
    input wire [2:0] select,
    output wire out0,
    output wire out1,
    output wire out2,
    output wire out3,
    output wire out4,
    output wire out5,
    output wire out6,
    output wire out7
);

wire [1:0] sel1;
wire [1:0] sel2;
wire out4_int, out5_int, out6_int, out7_int;

// Split the 3-bit select signal into two 2-bit select signals
assign {sel2, sel1} = select;

// Create two 1-to-4 demux instances
demux_1to4 d1to4_0 (
    .enable(enable),
    .select(sel1),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3)
);

demux_1to4 d1to4_1 (
    .enable(enable),
    .select(sel2),
    .out0(out4_int),
    .out1(out5_int),
    .out2(out6_int),
    .out3(out7_int)
);

// Connect the outputs
assign out4 = enable ? out4_int : 1'b0;
assign out5 = enable ? out5_int : 1'b0;
assign out6 = enable ? out6_int : 1'b0;
assign out7 = enable ? out7_int : 1'b0;

endmodule
