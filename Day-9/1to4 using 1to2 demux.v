module demux_1to2 (
    input wire enable,
    input wire select,
    output wire out0,
    output wire out1
);

assign out0 = (enable && (select == 1'b0)) ? 1'b1 : 1'b0;
assign out1 = (enable && (select == 1'b1)) ? 1'b1 : 1'b0;

endmodule

module demux_1to4 (
    input wire enable,
    input wire [1:0] select,
    output wire out0,
    output wire out1,
    output wire out2,
    output wire out3
);

wire mid0, mid1;

demux_1to2 d1to2_0 (
    .enable(enable),
    .select(select[0]),
    .out0(mid0),
    .out1(mid1)
);

demux_1to2 d1to2_1 (
    .enable(enable),
    .select(select[1]),
    .out0(out2),
    .out1(out3)
);

assign out0 = mid0;
assign out1 = mid1;

endmodule
