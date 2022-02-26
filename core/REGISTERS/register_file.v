/*
----------------------------------------------------------------
                         RISC-V Core
                      [ REGISTER FILE ]
--------------------------------------------------------------
- RISC-V base ISA consists of total 32 registers, each 32 bits wide.
- 31 of them are general-purpose registers r1-r31, which hold integer values.
- The register r0 is hardwired to the constant 0.
- We can use 5 bits to specify each register in register file for read and write operation.
- The register bank has 2 read ports and 1 write port.

*/

module reg_file(

    input clk,
    input reset,        // to reset the register file
    input [4:0] rs1,    // read_reg1 offset
    input [4:0] rs2,    // read_reg2 offset
    output [31:0] rd1,  // read_reg1 data
    output [31:0] rd2,  // read_reg2 data

    input write,
    input [4:0] rw,       // offset for write register
    input [31:0] rwd // register write data
    //input stall
);

    // 32 bit registers
    reg [31:0] r [31:0];

    // reset all register values
    always @ (posedge reset)
      begin
        r[0] =  32'd0;
        r[1] =  32'd1;
        r[2] =  32'd2;
        r[3] =  32'd3;
        r[4] =  32'd4;
        r[5] =  32'd5;
        r[6] =  32'd6;
        r[7] =  32'd7;
        r[8] =  32'd8;
        r[9] =  32'd9;
        r[10] = 32'd10;
        r[11] = 32'd11;
        r[12] = 32'd12;
        r[13] = 32'd13;
        r[14] = 32'd14;
        r[15] = 32'd15;
        r[16] = 32'd16;
        r[17] = 32'd17;
        r[18] = 32'd18;
        r[19] = 32'd19;
        r[20] = 32'd20;
        r[21] = 32'd21;
        r[22] = 32'd22;
        r[23] = 32'd23;
        r[24] = 32'd24;
        r[25] = 32'd25;
        r[26] = 32'd26;
        r[27] = 32'd27;
        r[28] = 32'd28;
        r[29] = 32'd29;
        r[30] = 32'd30;
        r[31] = 32'd31;
      end

    // register write (except r0)
    always @ (posedge clk)
      begin
        if (write & rw!=0)
          r[rw] = rwd;
      end


    // register read  (except r0)
    assign rd1 = rs1==0 ? 32'b0 : r[rs1];
    assign rd2 = rs2==0 ? 32'b0 : r[rs2];

endmodule
