`timescale 1ns / 1ps

module tb_pipelined_datapath;

reg clk;
reg [3:0] A;
reg [3:0] B;
reg [3:0] C;

wire [8:0] result;

pipelined_datapath dut(
    .clk(clk),
    .A(A),
    .B(B),
    .C(C),
    .result(result)
);

initial begin
    clk = 0;
end

always #10 clk = ~clk;

initial begin
    // Operation 1: (2+3)*4 = 20
    A = 4'd2;
    B = 4'd3;
    C = 4'd4;

    #20;

    // Operation 2: (5+1)*2 = 12
    A = 4'd5;
    B = 4'd1;
    C = 4'd2;

    #20;

    // Operation 3: (4+2)*3 = 18
    A = 4'd4;
    B = 4'd2;
    C = 4'd3;

    #40;
    $finish;
end

endmodule
