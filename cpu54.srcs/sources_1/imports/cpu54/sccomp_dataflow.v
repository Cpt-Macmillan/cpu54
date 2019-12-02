`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module sccomp_dataflow(
    output [7:0]o_seg,
    output [7:0]o_sel,
    input clk_in,
    input reset
    //input switch_mux,
    //input [4:0]scope,
    //output clk_cpu,
    //output [31:0]pc,
    //output [31:0]inst
);
    //wire [31:0] inst;
    //wire [31:0] pc;
    
    //wire clk_cpu;
    wire clk_cpu;
    wire [31:0]inst;
    //wire clk_display7;
    //wire [31:0] Regfiles31;
    wire [31:0] Ins_add;//含4地址
    wire [31:0] DMEM_Write;
    wire [31:0] DMEM_WD;
    wire [15:0] DMEM_HW;
    wire [7:0] DMEM_byte;
    wire [31:0] ALU_result;
    wire [1:0]DMEM_wri_ctr;
    //assign pc = Ins_add;
    
    clk_wiz_0 clk_wiz_0_1(
        .clk_in1(clk_in),
        .reset(reset),
        .clk_out1(clk_cpu)
    );
    wire [31:0] scope_data;
    
    cpu sccpu(
        .clk_in(clk_cpu),//记得改了
        .reset(reset),
        .inst(inst),
        .pc(Ins_add),   //含4地址   
        .DMEM_Write(DMEM_Write),
        .DMEM_WD(DMEM_WD),
        .DMEM_HW(DMEM_HW),
        .DMEM_byte(DMEM_byte),
        .DMEM_wri_ctr(DMEM_wri_ctr),
        .ALU_result(ALU_result),
        .scope(scope),
        .scope_data(scope_data)
    );
    

    DMEM_temp dmem(
        .clk(clk_cpu),
        .DMEM_Write_ctr(DMEM_wri_ctr),
        .Address({21'b0,ALU_result[10:0]}),
        .Write(DMEM_Write),
        .DMEM_WD(DMEM_WD),
        .DMEM_HW(DMEM_HW),
        .DMEM_byte(DMEM_byte)
    );
    
    dist_mem_gen_0 imem(
        .a(Ins_add[12:2]),//2048 11位,2-12
        .spo(inst)
    );
    

    wire [31:0] data_disp;
//    MUX_display7 mux_disp7(
//        .switch(switch_mux),
//        .instr(Ins_add),
//        .data_scope(scope_data),
//        .data_disp7(data_disp)
//    );

    seg7x16 display7(
        .clk(clk_in),
        .reset(reset),
        .cs(1'b1),
        .i_data(Ins_add),
        .o_seg(o_seg),
        .o_sel(o_sel)
    );

    
endmodule
