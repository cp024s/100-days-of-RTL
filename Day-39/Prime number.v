module PrimeChecker (
    input wire [31:0] num,   // Input number to check for primality
    output wire is_prime     // Output indicating if the number is prime
);

reg [31:0] i;
reg is_prime_internal;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        i <= 2;
        is_prime_internal <= 1'b1;  // Assume the number is prime
    end else begin
        if (i <= sqrt(num)) begin
            if (num % i == 0) begin
                is_prime_internal <= 1'b0;  // Number is not prime
            end else begin
                i <= i + 1;
            end
        end
    end
end

assign is_prime = (num > 1) ? is_prime_internal : 1'b0;

endmodule
