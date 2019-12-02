`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/01 16:55:38
// Design Name: 
// Module Name: Extend_HW16_32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Extend_HW16_32(
    input [15:0] DMEM_HW,
    input EXTHW_sign_ctr,
    output [31:0] DMEM_HW_32
    );
    assign DMEM_HW_32[15:0] = DMEM_HW;
    assign DMEM_HW_32[31:16] = (EXTHW_sign_ctr & DMEM_HW[15]) ? 16'hffff : 16'h0000;//只有考虑正负，且imm为负数的时候，才需要做符号扩展
endmodule
