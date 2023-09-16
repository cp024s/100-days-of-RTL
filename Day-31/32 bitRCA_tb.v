module testbench_ripple_carry_adder;

    // Inputs
    reg [31:0] A, B;
    
    // Outputs
    wire [31:0] sum;
    wire carry_out;

    // Instantiate the Ripple Carry Adder
    ripple_carry_adder UUT (
        .A(A),
        .B(B),
        .sum(sum),
        .carry_out(carry_out)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Test cases
    initial begin
        // Case 1: Testing 0xABCDEF01 + 0x12345678
        A = 32'hABCDEF01;
        B = 32'h12345678;
        #10; // Allow some time for computation
        $display("Case 1 - A: 0x%h, B: 0x%h, Sum: 0x%h, Carry Out: %b", A, B, sum, carry_out);

        // Case 2: Testing 0xFFFFFFFF + 0x00000001
        A = 32'hFFFFFFFF;
        B = 32'h00000001;
        #10; // Allow some time for computation
        $display("Case 2 - A: 0x%h, B: 0x%h, Sum: 0x%h, Carry Out: %b", A, B, sum, carry_out);

        // Add more test cases here
        
        $finish; // End simulation
    end

endmodule
