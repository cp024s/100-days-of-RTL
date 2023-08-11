module alu(a,b,mode,out);
input [3:0]a,b;
input [2:0]mode;
output reg[3:0]out;
always@(mode or a or b)
begin
case (mode)
3'b000:out[3:0]<=a[3:0]+b[3:0];
3'b001:out[3:0]<=a[3:0]-b[3:0];
3'b010:out[3:0]<=a[3:0]&b[3:0];
3'b011:out[3:0]<=a[3:0]|b[3:0];
3'b100:out[3:0]<=~a[3:0];
3'b101:out[3:0]<=~(a[3:0]&b[3:0]);
3'b110:out[3:0]<=~(a[3:0]|b[3:0]);
3'b111:out[3:0]<=a[3:0]^b[3:0];
endcase
end
endmodule
