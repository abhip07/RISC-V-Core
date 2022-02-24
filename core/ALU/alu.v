/*
----------------------------------------------------------------
                         RISC-V Core
                [ ARITHMATIC LOGIC UNIT (ALU) ]
----------------------------------------------------------------

- This ALU takes 2 inputs ip1 and ip2, each of size 32 bits.
- Here the 4 bit operation represents one of the 16 operations
  that can be done by this core.
- zero flag gets activated whenever the result of alu operation is 0.

*/

`include "./../constants.v"

module alu (

    input [31:0] ip1,
    input [31:0] ip2,
    input [6:0] operation,
    output reg [31:0] result,
    output reg zero_flag
);

    always @ (*)
      begin
        case (operation)

          `ADD  : result = ip1 + ip2;
          `SUB  : result = ip1 - ip2;
          `AND  : result = ip1 & ip2;
          `OR   : result = ip1 | ip2;
          `XOR  : result = ip1 ^ ip2;
          `MUL  : result = ip1*ip2;
          `DIV  : result = $signed(ip1) / $signed(ip2);
          `DIVU : result = ip1 / ip2;
          `REM  : result = $signed(ip1) % $signed(ip2);  // remainder
          `REMU : result = ip1 % ip2;           // remainder unsigned
          `SLL  : result = ip1 << ip2;          // Shift Left Logical
          `SLTU : result = ip1 < ip2 ? 1 : 0;   // Set Less Than Unsigned
          `SRL  : result = ip1 >> ip2;          // Shift Right Logical
          `SRA  : result = $signed(ip1) >> ip2; // Shift Right Arithmatic
          `LUI  : result = ip1 << 12;           // Load Upper Immediate
          `NONE : result = 0;                   // No Operation
        endcase

        if (result == 0)
          zero_flag = 1'b1;
        else
          zero_flag = 1'b0;

      end

endmodule
