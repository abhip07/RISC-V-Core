/*
----------------------------------------------------------------
                         RISC-V Core
                   [ INSTRUCTION DECODER ]
----------------------------------------------------------------

- In this implementation of instruction decoder which takes an 32-bit
  instruction as input.
- It decodes 32 bit instruction into opcode, source registers and destination register

      -------------------------------------------------
      | opcode |   rd   | func3 |  rs1  |  rs2  | func7 |
      -------------------------------------------------
      0       6|7     11|12   14|15   19|20   24|25   31|

 - Here func3 indicated type of instruction (R-Type, Load/Store. Immediate, etc.)
 - Func7 is  used in immediate instructions.

*/

module decode(
    input [31:0] instruction,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [6:0] operation,
    output reg write,
    output reg [4:0] rw
);

    reg type; // temp
    always @(instruction)
      begin
        operation = instruction[6:0]; // opcode
        rs1 = instruction[24:20]; // source register 1
        rs2 = instruction[19:15]; // source register 2
        rw = instruction[11:7];   // destination register
        type = instruction[14:12]; // Type of Instruction

        write = (type == 3'b000) ? 1'b1 : 1'b0; // R-Type Instruction
      end

endmodule
