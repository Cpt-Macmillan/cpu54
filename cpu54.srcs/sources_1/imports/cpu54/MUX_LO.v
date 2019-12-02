`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/05 11:09:27
// Design Name: 
// Module Name: MUX_LO
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

module MUX_LO(
    input MUX_LO_ctr,
    input [31:0] Rd_rs,
    input [31:0] ALU_lo,
    output [31:0] Write_lo
    );
    assign Write_lo = MUX_LO_ctr ? Rd_rs : ALU_lo;
endmodule
