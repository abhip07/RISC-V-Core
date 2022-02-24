// Testbench for instruction fetch unit

`include "fetch.v"

module testbench();

    reg clk, reset;
    wire [31:0] instruction;

    fetch fetch_inst(
        .clk(clk),
        .reset(reset),
        .instruction(instruction)
    );

    // saving output wave
    initial
    begin
        $monitor($time, " clock=%b, reset=%b, instruction=%h", clk, reset, instruction);

        $dumpfile("output.vcd");
        $dumpvars(0, testbench);

    end

    // Initializing reset
    initial
      begin
        reset = 1'b1;
        #10  reset = 1'b0;
        #120 reset = 1'b1;
        #50  reset = 1'b0;
      end

    // Initializing clock
    initial
      begin
        clk = 1;
        forever #10 clk = ~clk;
      end

    initial
      #200 $finish();

endmodule
