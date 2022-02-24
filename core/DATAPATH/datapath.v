/*
----------------------------------------------------------------
                         RISC-V Core
                   [ PROCESSOR DATAPATH ]
----------------------------------------------------------------

This part of the processor contains the hardware connections
necessary to perform operations required by the processor.

*/

`include "./../ALU/alu.v"
`include "./../REGISTERS/register_file.v"

module datapath(
    input [4:0]rs1, // Source register 1 offset
    input [4:0]rs2, // Source register 2 offset
    input [4:0]rw,  // write register offset
    input [4:0]operation,
    input write,
    input clk,
    input reset,
    output zero_flag
);

    // interconnections wires between 'REGISTER FILE' and 'ALU'
    wire [31:0]rd1;  // source register 2 data
    wire [31:0]rd2;  // source register 2 data
    wire [31:0]rwd;  // Write register data

    // Creating register file instance
    reg_file register_inst(
        .clk(clk),
        .reset(reset),
        .rs1(rs1),
        .rs2(rs2),
        .rd1(rd1),
        .rd2(rd2),
        .rw(rw),
        .rwd(rwd),
        .write(write)
    );

    // Creating ALU instance
    alu alu_inst(
        .ip1(rd1),
        .ip2(rd2),
        .operation(operation),
        .result(rwd),
        .zero_flag(zero_flag)
    );

endmodule
