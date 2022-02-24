
// Testbench for register file in verilog.

`include "register_file.v"

module testbench();

    reg [4:0] rs1;
    reg [4:0] rs2;
    reg [4:0] rw;
    reg write;
    reg clk;
    reg reset;

    wire [31:0] rd1;
    wire [31:0] rd2;
    reg [31:0] rwd;
    //reg stall;


    reg_file registers(
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

    initial
      begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        //$display($time, "")
      end


    // clock

    initial
      begin
        clk = 0;

        forever #10 clk = ~clk;
      end

    // reset
    initial
      begin
        reset = 1;

        #10 reset = 0;
      end


    // register write
    initial
      begin
        write = 0;

        #10
        write = 1; rwd = 1; rw = 3;

        #10
        rwd = 0; rw = 25;

        #10
        rwd = 1; rw = 31;

        #10
        write = 1; rwd = 1; rw = 27;

        #10
        write = 1; rwd = 0; rw = 17;

      end

    // register read
    initial
      begin

        #10 rs1 = 3; rs2 = 3;

        #10 rs1 = 3; rs2 = 17;

        #10 rs1 = 31; rs2 = 27;

        #10 rs1 = 27; rs2 = 3;
      end

    initial
      begin
        #200 $finish;
      end

endmodule
