/*

----------------------------------------------------------------
                         RISC-V Core
                      [ PROCESSOR CORE ]
----------------------------------------------------------------

-  Here we have Implemented complete processor by integrating
  different modules like Fetch, Decode, Datapath.

- In datapath module, I have combined 3 stages (execute, memory &
  write back.
*/

`include "./../FETCH/fetch.v"
`include "./../DATAPATH/datapath.v"
`include "./../DECODE/decode.v"


module core(
    input clk,
    input reset,
    output zero_flag
);

  wire [31:0] instruction;
  wire [6:0] operation;
  wire write;
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [4:0] rw;

  // Instruction Fetch Stage

  fetch instruction_fetch(
      .clk(clk),
      .reset(reset),
      .instruction(instruction)
  );


  // INstruction Decode Stage
  decode instruction_decode(
      .instruction(instruction),
      .rs1(rs1),
      .rs2(rs2),
      .operation(operation),
      .write(write),
      .rw(rw)
  );

  // Execute, Memory and Write Back Stage
  datapath datapath_module(
      .rs1(rs1),
      .rs2(rs1),
      .rw(rw),
      .operation(operation),
      .write(write),
      .clk(clk),
      .reset(reset),
      .zero_flag(zero_flag)
  );

endmodule
