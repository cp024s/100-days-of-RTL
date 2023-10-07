module ROM (
    input [7:0] address,
    output reg [7:0] data
);

// Define the ROM data. You can replace these values with your own.
reg [7:0] rom_data [0:255];
initial begin
    // Initialize the ROM data with desired values.
    rom_data[0]  = 8'b00000000;
    rom_data[1]  = 8'b00000001;
    // Add more data values as needed.
    // ...

    // For example, filling the ROM with sequential values:
    for (int i = 2; i < 256; i = i + 1) begin
        rom_data[i] = rom_data[i-1] + 1;
    end
end

// Output data based on the address input.
always @(posedge address) begin
    data <= rom_data[address];
end

endmodule
