// Testbench for Datapath module
`include "datapath.v"
`include "./../constants.v"

module testbench();

    reg [4:0] rs1;
    reg [4:0] rs2;
    reg [4:0]rw;
    reg [4:0]operation;
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
          #25 rs1 = 32'd52; rs2 = 32'd87; operation = `ADD;
          #25 rs1 = 32'd14; rs2 = 32'd23; operation = `SUB;
          #25 rs1 = 32'd10; rs2 = 32'd4;  operation = `AND;
          #25 rs1 = 32'd7466; rs2 = 32'd962; operation = `OR;
          #25 rs1 = 32'd3112; rs2 = 32'd45; operation = `DIV;
        end

      initial
        #200 $finish();

endmodule
