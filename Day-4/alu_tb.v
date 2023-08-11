module alu_tb;
    reg [3:0] a, b;
    reg [2:0] mode;
    wire [3:0] out;

    alu uut (
        .a(a),
        .b(b),
        .mode(mode),
        .out(out)
    );

    initial begin
        $monitor("a=%b, b=%b, mode=%b, out=%b", a, b, mode, out);
        
        a = 4'b0010; // Example input values
        b = 4'b1100;
        
        for (mode = 0; mode < 8; mode = mode + 1) begin
            #10; // Wait for a few time units before changing inputs
        end
        
        $finish;
    end
endmodule
