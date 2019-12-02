`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/01 16:36:08
// Design Name: 
// Module Name: HI_LO
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


module HI_LO(
    input rst,
    input clk,
    input [31:0] Write_hi,
    input [31:0] Write_lo,
    output [31:0] Rd_hi,
    output [31:0] Rd_lo,
    input HI_Write_ctr,
    input LO_Write_ctr
    );
    reg [31:0] hi;
    reg [31:0] lo;
    assign Rd_hi = hi;
    assign Rd_lo = lo;
    
    always @(negedge clk) begin
        if(rst) begin
            hi <= 32'b0;
            lo <= 32'b0; 
        end
        if(HI_Write_ctr) begin
            //×¼ÐíÐ´Èë
            hi <= Write_hi;
        end
        if(LO_Write_ctr)begin
            lo <= Write_lo;
        end
    end
endmodule
