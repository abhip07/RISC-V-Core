/*
----------------------------------------------------------------
                         RISC-V Core
                [ INSTRUCTION MEMORY ]
----------------------------------------------------------------
- Here we have created 32 byte memory and saved 8 instructions, each of length 4-bytes in the memory.
- As we can see, Instruction memory takes 2 arguments : 32 bit Program Counter and 1 bit reset
- the memory is initialized when reset is 1.
- When reset is not 1, instructions are assigned based on pc value.

*/

module instruction_memory(

    input [31:0] pc,
    input reset,
    output [31:0] instruction

);

    // Memory bank of 32 registers each of size 1 byte
    reg [7:0] Memory[31:0]; // 32 bytes memory

    // Here we will assign instruction code based on PC
    assign instruction = {Memory[pc+3], Memory[pc+2], Memory[pc+1], Memory[pc]};

    // When rest

    always @(reset)
      begin

        if (reset == 1)
        begin
        // Setting 32-bit instruction: add rd, rs1,rs2 => 0x00940333
        Memory[3] = 8'h00;
        Memory[2] = 8'h94;
        Memory[1] = 8'h03;
        Memory[0] = 8'h33;

        // Setting 32-bit instruction: sub rd, rs1,rs2 => 0x413903b3
        Memory[7] = 8'h41;
        Memory[6] = 8'h39;
        Memory[5] = 8'h03;
        Memory[4] = 8'hb3;

        // Setting 32-bit instruction: mul rd, rs1,rs2 => 0x035a02b3
        Memory[11] = 8'h03;
        Memory[10] = 8'h5a;
        Memory[9] = 8'h02;
        Memory[8] = 8'hb3;

        // Setting 32-bit instruction: xor rd, rs1,rs2 => 0x017b4e33
        Memory[15] = 8'h01;
        Memory[14] = 8'h7b;
        Memory[13] = 8'h4e;
        Memory[12] = 8'h33;

        // Setting 32-bit instruction: sll rd, rs1,rs2
        Memory[19] = 8'h01;
        Memory[18] = 8'h9c;
        Memory[17] = 8'h1e;
        Memory[16] = 8'hb3;

        // Setting 32-bit instruction: srl rd, rs1,rs2
        Memory[23] = 8'h01;
        Memory[22] = 8'hbd;
        Memory[21] = 8'h5f;
        Memory[20] = 8'h33;

        // Setting 32-bit instruction: and t6, a2, a3
        Memory[27] = 8'h00;
        Memory[26] = 8'hd6;
        Memory[25] = 8'h7f;
        Memory[24] = 8'hb3;

        // Setting 32-bit instruction: or a7, a4, a5
        Memory[31] = 8'h00;
        Memory[30] = 8'hf7;
        Memory[29] = 8'h68;
        Memory[28] = 8'hb3;
        end

      end


endmodule
