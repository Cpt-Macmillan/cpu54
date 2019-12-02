`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/15 18:38:05
// Design Name: 
// Module Name: CP0
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


module CP0(
    input clk,
    input rst,
    input mfc0,
    input mtc0,
    input [31:0]pc,
    input [4:0]Rd,//mfc0读地址
    input [31:0]wdata,//mtc0写数据
    input exception,//异常发生
    input eret,
    input [4:0]cause,//传递什么数据
    output [31:0]rdata,//mfc0读数据
    //output [31:0]status,//status寄存器
    output [31:0]exc_addr//返回给pc的地址
);
integer i;
reg[31:0]cp0[31:0];
reg[31:0] status_temp;
//assign status=cp0[12];
assign rdata=mfc0?cp0[Rd]:32'hz;
assign exc_addr=(eret==1)?cp0[14]:32'h00400004;
always@(negedge clk)
begin
    if(rst)begin
        for(i=0;i<32;i=i+1)
            cp0[i]<=0;
    end
    else begin
    if(mtc0)
        cp0[Rd]<=wdata;
    else 
        if(exception) begin
            status_temp<=cp0[12];
                if(eret==1'b0) begin
                    cp0[12]<=cp0[12]<<5;
                    cp0[13]<={25'b0,cause,2'b0};
                    cp0[14]<=pc;
                end
                else
                    cp0[12]<=status_temp;
        end
    end
end
endmodule
