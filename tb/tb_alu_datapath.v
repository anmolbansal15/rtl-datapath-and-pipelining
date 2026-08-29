`timescale 1ns / 1ps

module alu_tb;

reg clk;
reg enable;
reg [3:0] a;
reg [3:0] b;
reg [1:0] ctrl;

wire [3:0] alu_out;
wire [3:0] res;

alu_datapath dut(
    .clk(clk),
    .ena(enable),
    .A(a),
    .B(b),
    .alu_ctrl(ctrl),
    .alu_out(alu_out),
    .result(res)
);

initial begin
    clk = 0;
end

always #10 clk = ~clk;

initial begin
    enable = 1;
    a = 4'd10;
    b = 4'd3;
    ctrl = 2'b01;

    #15;

    enable = 0;
    a = 4'd5;
    b = 4'd2;

    #20;
    $finish;
end

endmodule
