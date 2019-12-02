`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

//组合 上升沿更新
module Extend_16_32(
    input [15:0] imm,
    input EXT_sign_ctr,
    output [31:0] imm_32
    );
    assign imm_32[15:0] = imm;
    assign imm_32[31:16] = (EXT_sign_ctr & imm [15]) ? 16'hffff : 16'h0000;//只有考虑正负，且imm为负数的时候，才需要做符号扩展
endmodule
