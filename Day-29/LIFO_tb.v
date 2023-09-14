module lifo_queue_tb;

  reg clk;
  reg reset;
  reg push;
  reg pop;
  reg [7:0] data_in;
  wire [7:0] data_out;

  // Instantiate the lifo_queue module
  lifo_queue lifo_queue_inst (
    .clk(clk),
    .reset(reset),
    .push(push),
    .pop(pop),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Test scenarios
  initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    push = 0;
    pop = 0;
    data_in = 8'b0;

    // Test Scenario 1: Push and Pop an element
    $display("Test Scenario 1: Push and Pop an element");
    push = 1;
    data_in = 8'hAA;
    #10 push = 0;
    #10 pop = 1;
    #10 pop = 0;
    #10;

    // Test Scenario 2: Push multiple elements and Pop them
    $display("Test Scenario 2: Push multiple elements and Pop them");
    push = 1;
    data_in = 8'hAA;
    #10 push = 0;
    push = 1;
    data_in = 8'hBB;
    #10 push = 0;
    push = 1;
    data_in = 8'hCC;
    #10 push = 0;
    pop = 1;
    #10 pop = 0;
    pop = 1;
    #10 pop = 0;
    pop = 1;
    #10;

    // Test Scenario 3: Push more elements than the queue size
    $display("Test Scenario 3: Push more elements than the queue size");
    push = 1;
    data_in = 8'hAA;
    #10 push = 0;
    push = 1;
    data_in = 8'hBB;
    #10 push = 0;
    push = 1;
    data_in = 8'hCC;
    #10 push = 0;
    push = 1;
    data_in = 8'hDD;
    #10 push = 0;

    // Test Scenario 4: Pop from an empty queue
    $display("Test Scenario 4: Pop from an empty queue");
    pop = 1;
    #10 pop = 0;

    // Finish simulation
    $finish;
  end

endmodule
