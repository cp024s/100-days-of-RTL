
// Testbench module definition
module half_adder_tb;
    // Inputs
    reg A;
    reg B;
    // Outputs
    wire S;
    wire C;
    // Instantiate the half adder
    half_adder dut(
        .A(A),
        .B(B),
        .S(S),
        .C(C)
    );

    // Clock generation (optional)
    // reg clk = 0;
    // always #5 clk = ~clk;
    // Stimulus
    initial begin
        $display("A | B | S | C");
        $display("----------------");
        A = 0; B = 0; #5;
        $display("%b | %b | %b | %b", A, B, S, C);
        A = 0; B = 1; #5;
        $display("%b | %b | %b | %b", A, B, S, C);
        A = 1; B = 0; #5;
        $display("%b | %b | %b | %b", A, B, S, C);
        A = 1; B = 1; #5;
        $display("%b | %b | %b | %b", A, B, S, C);
        $finish;
    end
endmodule
