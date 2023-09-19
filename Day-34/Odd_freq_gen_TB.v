module tb_odd_frequency_generator();

  reg clk;
  reg rst;
  wire out;
  
  // Instantiate the odd frequency generator module
  odd_frequency_generator uut (
    .clk(clk),
    .rst(rst),
    .out(out)
  );
  
  // Clock generation
  always begin
    clk = 1;
    #5;  // 5 time units delay for a 50% duty cycle
    clk = 0;
    #5;  // 5 time units delay for a 50% duty cycle
  end

  // Reset the counter initially
  initial begin
    rst = 1;
    #10; // Reset for 10 time units
    rst = 0;
  end
  
  // Test different counter values
  initial begin
    #100; // Wait for a while to observe the output
    
    // Test for a few values of odd_number
    for (integer odd_number = 3; odd_number <= 15; odd_number = odd_number + 2) begin
      $display("Testing for odd_number = %d", odd_number);
      
      // Apply the odd_number to the counter
      uut.odd_number = odd_number;
      
      // Wait for a while to observe the output
      #100;
    end
    
    $finish;
  end
  
endmodule
