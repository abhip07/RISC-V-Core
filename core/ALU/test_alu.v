// Testbench for ALU Operation

`include "alu.v"
`include "./../constants.v"

module testbench ();

    reg [31:0] ip1, ip2;
    reg [4:0] operation;
    wire [31:0] result;
    wire zero_flag;

    // Creating and instance of ALU
    alu test_alu(
        .ip1(ip1),
        .ip2(ip2),
        .operation(operation),
        .result(result),
        .zero_flag(zero_flag)
    );

    // displaying and saving the results
    initial
      begin
      $monitor($time, " ip1 = %b, ip2 = %b, operation = %b, result = %b, flag = %b", ip1, ip2, operation, result, zero_flag);
      $dumpfile("output.vcd");
      $dumpvars(0, testbench);
      end

    initial
      begin

       ip1 = 23; ip2 = 46; operation = `ADD;

       #20 ip1 = 32'd23; ip2 = 32'd46; operation = `ADD;

       #20 ip1 = 32'd128; ip2 = 32'd59; operation = `SUB;

       #20 ip1 = 32'd23; ip2 = 32'd2; operation = `SLL;   // shift left

       #20 ip1 = 32'd654; ip2 = 32'd46; operation = `REMU; // remainder

       #20 ip1 = 32'b1; ip2 = 32'b1; operation = `AND;

       #20 ip1 = 32'b0; ip2 = 32'b1; operation = `OR;

       #20 ip1 = 32'b1; ip2 = 32'b1; operation = `XOR;

      end

      initial
        #200 $finish;

endmodule
