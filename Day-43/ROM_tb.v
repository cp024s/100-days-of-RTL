module ROM_tb;

reg [7:0] address;
wire [7:0] data;

// Instantiate the ROM module
ROM rom (
    .address(address),
    .data(data)
);

// Testbench initialization
initial begin
    $display("Testing ROM with 5 test cases...");
    $display("Address\tExpected Data\tActual Data\tPass/Fail");

    // Test case 1: Address 0x00
    address = 8'h00;
    #1;
    if (data === 8'b00000000) begin
        $display("%d\t%d\t%d\tPass", address, 8'b00000000, data);
    end else begin
        $display("%d\t%d\t%d\tFail", address, 8'b00000000, data);
    end

    // Test case 2: Address 0x0F
    address = 8'h0F;
    #1;
    if (data === 8'b00001111) begin
        $display("%d\t%d\t%d\tPass", address, 8'b00001111, data);
    end else begin
        $display("%d\t%d\t%d\tFail", address, 8'b00001111, data);
    end

    // Test case 3: Address 0x80
    address = 8'h80;
    #1;
    if (data === 8'b10000000) begin
        $display("%d\t%d\t%d\tPass", address, 8'b10000000, data);
    end else begin
        $display("%d\t%d\t%d\tFail", address, 8'b10000000, data);
    end

    // Test case 4: Address 0xFF
    address = 8'hFF;
    #1;
    if (data === 8'b11111111) begin
        $display("%d\t%d\t%d\tPass", address, 8'b11111111, data);
    end else begin
        $display("%d\t%d\t%d\tFail", address, 8'b11111111, data);
    end

    // Test case 5: Address 0xAA
    address = 8'hAA;
    #1;
    if (data === 8'b10101010) begin
        $display("%d\t%d\t%d\tPass", address, 8'b10101010, data);
    end else begin
        $display("%d\t%d\t%d\tFail", address, 8'b10101010, data);
    end

    $finish;
end

endmodule
