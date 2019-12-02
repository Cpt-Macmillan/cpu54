`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/08 23:02:09
// Design Name: 
// Module Name: MUX_display7
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


module MUX_display7(
    input switch,
    input [31:0]instr,
    input [31:0]data_scope,
    output [31:0]data_disp7
);
    assign data_disp7 = switch ? data_scope : instr;
endmodule
