`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////


module regfile(
    input [4:0] rs,//��� �����ظ��� ����ʱ�̶�ȡ
    input [4:0] rt,//��� �����ظ��� ����ʱ�̶�ȡ
    output [31:0] Rd_rs,
    output [31:0] Rd_rt,
    input clk,//ʱ��
    input rst,
    input RF_write_ctr,
    input [4:0] rd,//ʱ�� �½��ظ��� ��һ���½��ض�ȡ
    input [31:0] Write,//ʱ�� �½��ظ��� ��һ���½����ض�ȡ,
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
    /****��ϲ���****/
    assign Rd_rs = array_reg[rs];
    assign Rd_rt = array_reg[rt];
    
    /****ʱ�򲿷�****/
    always @(negedge clk) begin
    if(rst == 1) begin
        for(i=0;i<=31;i= i+1) begin
            array_reg[i] <= 0;
        end
    end else begin
        if(RF_write_ctr == 0)begin
            //ɶ������
        end
        else begin
            if(rd == 0) begin
                //ɶ������
            end
            else begin
                array_reg[rd] <= Write;
            end
        end
    end
    end
endmodule
