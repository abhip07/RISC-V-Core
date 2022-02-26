// testbench for processor core
`include "core.v"
module testbench();

    reg clk;
    reg reset;
    wire zero_flag;

    core test_core(
        .clk(clk),
        .reset(reset),
        .zero_flag(zero_flag)
    );

    // saving the output waveform
    initial
      begin
        $dumpfile("output.vcd");
        $dumpvars(0, testbench);
      end

    // initializing the clock signal
    initial
      begin
        clk = 0;
        forever #20 clk = ~clk;
      end

    // initializing reset signal
    initial
        begin
        reset  = 1;
        #10 reset = 0;
      end

    // simulation fnish time
    initial
      #400 $finish;

endmodule
