`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////


module regfile(
    input [4:0] rs,//组合 上升沿更新 任意时刻读取
    input [4:0] rt,//组合 上升沿更新 任意时刻读取
    output [31:0] Rd_rs,
    output [31:0] Rd_rt,
    input clk,//时序
    input rst,
    input RF_write_ctr,
    input [4:0] rd,//时序 下降沿更新 下一个下降沿读取
    input [31:0] Write,//时序 下降沿更新 下一个下降沿沿读取,
    input [4:0] scope,
    output [31:0] scope_data  
    );
    reg [31:0] array_reg [31:0];
    assign scope_data = array_reg[scope];                                  
    integer i;
//    always @(posedge rst) begin
//        if(rst == 1) begin
//            for(i=0;i<=31;i= i+1) begin
//                array_reg[i] <= 0;
//            end
//        end
//    end
    /****组合部分****/
    assign Rd_rs = array_reg[rs];
    assign Rd_rt = array_reg[rt];
    
    /****时序部分****/
    always @(negedge clk) begin
    if(rst == 1) begin
        for(i=0;i<=31;i= i+1) begin
            array_reg[i] <= 0;
        end
    end else begin
        if(RF_write_ctr == 0)begin
            //啥都不干
        end
        else begin
            if(rd == 0) begin
                //啥都不干
            end
            else begin
                array_reg[rd] <= Write;
            end
        end
    end
    end
endmodule
