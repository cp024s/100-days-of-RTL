// Testbench for the Johnson Counter
module testbench;

// Define testbench inputs
reg clk;
reg reset;
wire [3:0] q;

// Instantiate the Johnson Counter
johnson_counter dut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
end

// Initial values
initial begin
    clk = 0;
    reset = 0;
    #10 reset = 1; // Apply reset for 10 time units
    #10 reset = 0; // De-assert reset
    #50 $finish;   // Finish the simulation after 50 time units
end

// Display the Johnson counter output
always @(posedge clk) begin
    $display("q = %b", q);
end

endmodule

// Simulation
module tb_johnson_counter;
    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate the Johnson Counter
    johnson_counter dut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Initial values and simulation control
    initial begin
        clk = 0;
        reset = 0;
        #10 reset = 1; // Apply reset for 10 time units
        #10 reset = 0; // De-assert reset
        #100 $finish;  // Finish the simulation after 100 time units
    end

    // Display the Johnson counter output
    always @(posedge clk) begin
        $display("q = %b", q);
    end
endmodule
