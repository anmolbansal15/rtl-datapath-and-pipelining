`timescale 1ns / 1ps

module alu_datapath(
    input clk,
    input ena,
    input [3:0] A,
    input [3:0] B,
    input [1:0] alu_ctrl,
    output reg [3:0] alu_out,
    output reg [3:0] result
    );

always @(*) begin
    alu_out = 4'b0;
    case(alu_ctrl)
        2'b00: alu_out = A + B;
        2'b01: alu_out = A - B;
        2'b10: alu_out = A & B;
        2'b11: alu_out = A | B;
        default: alu_out = 4'b0;
    endcase
end

always @(posedge clk) begin
    if(ena)
        result <= alu_out;
end

endmodule
