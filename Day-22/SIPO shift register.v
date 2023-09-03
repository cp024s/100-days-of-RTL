module SIPO_Shift_Register (
    input wire clock,          // Clock input
    input wire reset,          // Reset input
    input wire serial_in,     // Serial input
    output wire [7:0] parallel_out // Parallel output
);

reg [7:0] shift_register;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        shift_register <= 8'b00000000; // Reset the shift register to all zeros
    end else begin
        // Shift the data in on the rising edge of the clock
        shift_register <= {shift_register[6:0], serial_in};
    end
end

assign parallel_out = shift_register;

endmodule
