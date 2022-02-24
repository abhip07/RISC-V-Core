/*

----------------------------------------------------------------
                         RISC-V Core
                 [ INSTRUCTION FETCH UNIT ]
----------------------------------------------------------------
- Here Instruction Fetch unit take clock and reset as input and
  it outputs 32-bit instruction code on every positive edge of clock.
- It internally uses an instance of instruction memory which to
  output 32 instruction code.
- At each fetch operation, the program counter is incremented by 4      bytes.

*/

`include "./../MEMORY/instruction_memory.v"

module fetch(
    input clk,
    input reset,
    output [31:0] instruction
);

    // Initialize the program counter as zero
    reg [31:0] pc = 32'b0;

    // Instruction Memory Bank
    instruction_memory inst_mem(
        .pc(pc),
        .reset(reset),
        .instruction(instruction)
    );

    always @(posedge clk, posedge reset)
      begin

        if (reset == 1)
          pc <= 32'b0;    // reset the pc to zero
        else
          // pointing to next instruction
          pc <= pc+4;
      end
endmodule
