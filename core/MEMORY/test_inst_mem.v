// Testbench for instruction memory

`include "instruction_memory.v"

module testbench();

    reg [31:0] pc;
    reg reset;
    wire [31:0] instruction;

    instruction_memory memory(
        .pc(pc),
        .reset(reset),
        .instruction(instruction)
    );

    initial
      begin
        $dumpfile("output.vcd");
        $dumpvars(0,testbench);
      end

    initial
      $monitor($time, " instruction = %h, pc = %d", instruction, pc);

    initial
      begin
        reset = 1'b0;
        #10 reset = 1'b1;
        #10 pc = 32'd5;
        #10 pc = 32'd1;
        #10 pc = 32'd7;
        #10 pc = 32'd2;
        #10 pc = 32'd9;
      end

    initial
    #100 $finish;

endmodule
