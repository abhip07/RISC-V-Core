/*
		CONSTANTS USED IN THIS PROJECT	

*/

// Macros for different ALU operations

`define ADD		7'd0
`define SUB		7'd1
`define AND		7'd2
`define OR		7'd3
`define XOR		7'd4
`define MUL		7'd5
`define DIV		7'd6
`define DIVU	7'd7
`define REM		7'd10
`define REMU	7'd11
`define SLL		7'd8
`define SLTU    7'd9
`define SRL		7'd14
`define SRA		7'd15
`define LUI		7'd12
`define NONE	7'd13


// Macros for Instruction Types

`define REG    3'b000   // R-Type Instructions
`define IMM    3'b001   // Immediate Instruction
`define LUI    3'b010   // U-Type Instruction
`define STORE  3'b011   // Store Instructions
`define LOAD   3'b100   // Load Instructions
`define BRANCH 3'b101   // Branch Instructions
`define JMP    3'b110   // Jump Instructions
`define PCR    3'b111   // P-Type Instructions


