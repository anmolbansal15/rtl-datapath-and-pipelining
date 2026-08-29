`timescale 1ns / 1ps

module pipelined_datapath(
    input clk,
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    output reg [8:0] result
    );

    reg [4:0] sum;
    reg [3:0] c_reg;

    // Pipeline stage 1: compute A+B and delay C
    always @(posedge clk) begin
        sum   <= A + B;
        c_reg <= C;
    end

    // Pipeline stage 2: multiply the registered values
    always @(posedge clk) begin
        result <= sum * c_reg;
    end

endmodule
