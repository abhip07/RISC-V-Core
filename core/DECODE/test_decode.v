// Testbench for Instruction decoder
`include "decode.v"
module testbench();

  reg [31:0] instruction;
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [6:0] operation;
  wire write;
  wire [4:0] rw;

  decode decode_inst(

      .instruction(instruction),
      .rs1(rs1),
      .rs2(rs2),
      .operation(operation),
      .write(write),
      .rw(rw)
  );

  initial
    begin
      $monitor($time, " instruction=%b, rs1=%d, rs2=%d, operation=%d, write=%b, rd=%d", instruction, rs1, rs2, operation, write, rw);
      $dumpfile("output.vcd");
      $dumpvars(0, testbench);
    end

  initial
    begin
      instruction = 32'h4A41E108;
      #10 instruction = 32'h4A41E100;
      #10 instruction = 32'h9A51B501;
      #10 instruction = 32'h78D94E0A;
      #10 instruction = 32'h13E04A0C;
      #10 instruction = 32'h4A0D1307;
      #10 instruction = 32'h104A3E06;
      #10 instruction = 32'hE01A0302;
    end

endmodule
