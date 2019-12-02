`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Divider_Ins(
    input [31:0] Ins,   //32λָ��
    output [25:0] addr, //26λ��ת��ַ
    output [5:0] func,  //6λfunc
    output [5:0] op,    //6λop
    output [4:0] rs,    //5λrs��ַ
    output [4:0] rt,    //5Ϊrt��ַ
    output [4:0] rd,    //5λrd��ַ
    output [4:0] shamt, //5λ������
    output [15:0] imm   //16λ������
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
