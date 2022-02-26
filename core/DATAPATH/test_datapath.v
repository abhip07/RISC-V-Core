// Testbench for Datapath module
`include "datapath.v"
`include "./../constants.v"

module testbench();

    reg [4:0] rs1;
    reg [4:0] rs2;
    reg [4:0]rw;
    reg [6:0]operation;
    reg write;
    reg clk;
    reg reset;
    wire zero_flag;


    // creating datapath instance
    datapath datapath_inst(

        .rs1(rs1),
        .rs2(rs2),
        .rw(rw),
        .operation(operation),
        .write(write),
        .clk(clk),
        .reset(reset),
        .zero_flag(zero_flag)
    );


    initial
      begin
        $dumpfile("output.vcd");
        $dumpvars(0, testbench);
      end


    initial
      begin
        clk = 0;
        forever #10 clk = ~clk;
      end


    initial
      begin
        reset = 1;
        #20 reset = 0;
      end

      initial
      begin
        write = 0;
        #10 write=1;
      end


      initial
        begin
          #25 rs1 = 5'd5; rs2 = 5'd27; operation = `ADD; rw = 5'd11;
          #25 rs1 = 5'd14; rs2 = 5'd23; operation = `SUB; rw = 5'd9;
          #25 rs1 = 5'd10; rs2 = 5'd14;  operation = `AND; rw = 5'd1;
          #25 rs1 = 5'd7; rs2 = 5'd9; operation = `OR; rw = 5'd31;
          #25 rs1 = 5'd2; rs2 = 5'd21; operation = `DIV; rw = 5'd30;
        end

      initial
        #200 $finish();

endmodule
