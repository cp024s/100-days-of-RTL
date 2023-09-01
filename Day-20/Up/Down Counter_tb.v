module testbench;

  // Parameters
  reg clk;
  reg rst;
  reg up_down;
  wire [3:0] count;
  
  // Instantiate the UpDownCounter module
  UpDownCounter uut (
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .count(count)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Initializations
  initial begin
    clk = 0;
    rst = 0;
    up_down = 1; // Count up initially
    #10 rst = 1; // Activate reset
    #5 rst = 0;  // Deactivate reset
    #20 up_down = 0; // Change to count down
    #100 $finish; // End simulation after 100 time units
  end

  // Display the counter value
  always @(posedge clk) begin
    $display("Count = %h", count);
  end

endmodule
