`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/01 16:50:24
// Design Name: 
// Module Name: Extend_8_32
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


module Extend_8_32(
    input [7:0] DMEM_byte,
    input EXT8_sign_ctr,
    output [31:0] DMEM_byte_32
    );
    assign DMEM_byte_32[7:0] = DMEM_byte[7:0];
    assign DMEM_byte_32[31:8] = (EXT8_sign_ctr & DMEM_byte [7]) ? 24'hffffff : 24'h000000;//只有考虑正负，且imm为负数的时候，才需要做符号扩展
endmodule
