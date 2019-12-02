`timescale 1ns / 1ps

//组合 上升沿更新
//无符号扩展
module Extend_5_32(
    input [4:0] shamt,
    output [31:0] shamt_32
    );
    assign shamt_32 = {27'b0,shamt};
endmodule
