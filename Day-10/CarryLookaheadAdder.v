module CLA_adder (input [3:0] a, b, output [3:0] sum);
    
    wire [3:0] c;
    
    assign c[0] = a[0] & b[0];
    assign c[1] = a[1] & b[1] | a[1] & c[0] | b[1] & c[0];
    assign c[2] = a[2] & b[2] | a[2] & c[1] | b[2] & c[1];
    assign c[3] = a[3] & b[3] | a[3] & c[2] | b[3] & c[2];
    
    assign sum = a + b + c;
    
endmodule
