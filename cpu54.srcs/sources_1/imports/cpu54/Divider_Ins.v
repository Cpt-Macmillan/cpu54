`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Divider_Ins(
    input [31:0] Ins,   //32位指令
    output [25:0] addr, //26位跳转地址
    output [5:0] func,  //6位func
    output [5:0] op,    //6位op
    output [4:0] rs,    //5位rs地址
    output [4:0] rt,    //5为rt地址
    output [4:0] rd,    //5位rd地址
    output [4:0] shamt, //5位立即数
    output [15:0] imm   //16位立即数
    );
    assign    addr = Ins[25:0];
    assign    imm = Ins[15:0];
    assign  func = Ins[5:0];
    assign    shamt = Ins[10:6];
    assign    rd = Ins[15:11];
    assign    rt = Ins[20:16];
    assign    rs = Ins[25:21];
    assign    op = Ins[31:26];
endmodule
