module FibonacciGenerator (
    input wire clk,         // Clock input
    input wire rst,         // Reset input
    output reg [31:0] fib  // Output Fibonacci number (32-bit)
);

// Internal signals
reg [31:0] current, next;
reg [31:0] fib_1, fib_2;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        current <= 1;   // Initial Fibonacci number
        next <= 1;      // Next Fibonacci number
        fib_1 <= 0;     // Temporary storage for previous Fibonacci number
        fib_2 <= 0;     // Temporary storage for two Fibonacci numbers ago
    end else begin
        current <= next; // Current Fibonacci number becomes next
        next <= current + fib_1; // Calculate next Fibonacci number
        fib_1 <= current; // Update temporary storage
        fib_2 <= fib_1;   // Update temporary storage
    end
end

assign fib = current; // Output the current Fibonacci number

endmodule
