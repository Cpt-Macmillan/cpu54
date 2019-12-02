`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/01 17:12:10
// Design Name: 
// Module Name: MUX_HI
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


module MUX_HI(
    input MUX_HI_ctr,
    input [31:0] Rd_rs,
    input [31:0] ALU_hi,
    output [31:0] Write_hi
    );
    assign Write_hi = MUX_HI_ctr ? Rd_rs : ALU_hi;
endmodule
