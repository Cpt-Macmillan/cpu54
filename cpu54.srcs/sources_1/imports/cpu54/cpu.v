`timescale 1ns / 1ps

module cpu(  
    input clk_in,
    input reset,
    input [31:0] inst,
    output [31:0] pc,
    input [4:0] scope,
    output [31:0] scope_data,
    output [31:0] DMEM_Write,
    input [31:0] DMEM_WD,
    input [15:0] DMEM_HW,
    input [7:0] DMEM_byte,
    output [1:0]DMEM_wri_ctr,
    output [31:0] ALU_result
    );
    
    wire EXT8_sign_ctr;
    wire EXTHW_sign_ctr;
    wire MUX_HI_ctr;
    wire MUX_LO_ctr;
    wire HI_Write_ctr;
    wire LO_Write_ctr;
    /**/wire [31:0] NPC;
    /**/wire [31:0] PC_plus4;
    /**/wire [4:0] ALU_ctr;
    /**/wire [31:0] ALU_A;
    /**/wire [31:0] ALU_B;
    /**/wire  MUX_ALU_A_ctr;
    /**/wire  MUX_ALU_B_ctr;
    /**/wire  [2:0] MUX_PC_ctr;
    /**/wire  [2:0] MUX_RF_Write_ctr;
    /**/wire  [1:0] MUX_RF_rd_ctr;
    /**/wire  EXT_sign_ctr;
    /**/wire  RF_Write_ctr;
    /**/wire [4:0]RF_rd;
    /**/wire [31:0] Rd_rs;
    /**/wire [31:0] Rd_rt;
    /**/wire [31:0] Write;
    /**/wire [25:0] addr; //26位跳转地址
    /**/wire [5:0] func;  //6位func
    /**/wire [5:0] op;  //6位op
    /**/wire [4:0] rs;    //5位rs地址
    /**/wire [4:0] rt;   //5为rt地址
    /**/wire [4:0] rd;    //5位rd地址
    

    
    wire [31:0] Ins_add;//假地址（含4地址）
//    wire [31:0] NPC;
    assign pc = Ins_add;
    PC pc1(
        .clk(clk_in),
        .rst(reset),
        .NPC(NPC),
        .Ins_add(Ins_add)
    );
    
//    wire [31:0] PC_plus4;
    PC_plus4 pc_plus4(
        .Ins_add(Ins_add),
        .PC_plus4(PC_plus4)
    );
    
    

    
    
//    wire [25:0] addr; //26位跳转地址
//    wire [5:0] func;  //6位func
//    wire [5:0] op;  //6位op
//    wire [4:0] rs;    //5位rs地址
//    wire [4:0] rt;    //5为rt地址
//    wire [4:0] rd;    //5位rd地址
    wire [4:0] shamt; //5位立即数
    wire [15:0] imm;   //16位立即数(没扩展）
    Divider_Ins divider_ins(
        .Ins(inst),
        .addr(addr),
        .func(func),
        .op(op),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .shamt(shamt),
        .imm(imm)
    );
    
    
//    wire [3:0] ALU_ctr;
//    wire MUX_ALU_A_ctr;
//    wire MUX_ALU_B_ctr;
//    wire [1:0] MUX_PC_ctr;
//    wire [1:0] MUX_RF_Write_ctr;
//    wire [1:0] MUX_RF_rd_ctr;
//    wire EXT_sign_ctr;
//    wire RF_Write_ctr;
//    wire DMEM_wri_ctr;
    wire eret;
    wire mfc0;
    wire mtc0;
    wire [4:0]cause;
    wire exc_CU;
    wire MUX_CP0_exc_ctr;
    Control_Unit cu(
        .func(func),
        .op(op),
        .ALU_ctr(ALU_ctr),
        .MUX_ALU_A_ctr(MUX_ALU_A_ctr),
        .MUX_ALU_B_ctr(MUX_ALU_B_ctr),
        .MUX_PC_ctr(MUX_PC_ctr),
        .MUX_RF_Write_ctr(MUX_RF_Write_ctr),
        .MUX_RF_rd_ctr(MUX_RF_rd_ctr),
        .EXT_sign_ctr(EXT_sign_ctr),
        .RF_Write_ctr(RF_Write_ctr),
        .DMEM_wri_ctr(DMEM_wri_ctr),
        
        .EXT8_sign_ctr(EXT8_sign_ctr),
        .EXTHW_sign_ctr(EXTHW_sign_ctr),
        .MUX_HI_ctr(MUX_HI_ctr),
        .MUX_LO_ctr(MUX_LO_ctr),
        .HI_Write_ctr(HI_Write_ctr),
        .LO_Write_ctr(LO_Write_ctr),
        
        .rs(rs),
        .eret(eret),
        .mfc0(mfc0),
        .mtc0(mtc0),
        .cause(cause),
        .exc_CU(exc_CU),
        .MUX_CP0_exc_ctr(MUX_CP0_exc_ctr)
    ); 
    
    
//    wire [4:0] RF_rd;
    MUX_RF_rd mux_rd(
        .MUX_RF_rd_ctr(MUX_RF_rd_ctr),
        .rd(rd),
        .rt(rt),
        .RF_rd(RF_rd)
    );
    
    
//    wire [31:0] Rd_rs;
//    wire [31:0] Rd_rt;
    assign DMEM_Write = Rd_rt;
//    wire [31:0] Write;//时序 上升沿更新 下降沿读取
    regfile cpu_ref(
        .rs(rs),
        .rt(rt),
        .Rd_rs(Rd_rs),
        .Rd_rt(Rd_rt),
        .clk(clk_in),
        .rst(reset),
        .RF_write_ctr(RF_Write_ctr),
        .rd(RF_rd),
        .Write(Write),
        .scope(scope),
        .scope_data(scope_data)
    );
    
    
    wire [31:0] shamt_32;
    Extend_5_32 ext_5(
        .shamt(shamt),
        .shamt_32(shamt_32)
    );
    
    
    wire [31:0] imm_32;
    Extend_16_32 ext_16(
        .imm(imm),
        .EXT_sign_ctr(EXT_sign_ctr),
        .imm_32(imm_32)
    );
    
    
    //wire [31:0] ALU_A;
    MUX_ALU_A mux_a(
        .MUX_ALU_A_ctr(MUX_ALU_A_ctr),
        .Rd_rs(Rd_rs),
        .shamt(shamt_32),
        .ALU_A(ALU_A)
    );
    
    
    //wire [31:0] ALU_B;
    MUX_ALU_B mux_b(
        .MUX_ALU_B_ctr(MUX_ALU_B_ctr),
        .Rd_rt(Rd_rt),
        .imm_extend(imm_32),
        .ALU_B(ALU_B)
    );
    
    wire [31:0] ALU_hi;
    wire [31:0] ALU_lo;
    ALU alu(
        .A(ALU_A),
        .B(ALU_B),
        .ALU_ctr(ALU_ctr),
        .imm(imm_32),
        .PC_plus4(PC_plus4),
        .result(ALU_result),
        .ALU_hi(ALU_hi),
        .ALU_lo(ALU_lo)
    );
    
    wire [31:0] PC_Joint_result;
    PC_Joint pc_joint(
        .addr(addr),
        .PC_plus4(PC_plus4[31:28]),
        .PC_Joint_result(PC_Joint_result)
    );

    wire [31:0] exc_addr;
    MUX_PC mux_pc(
        .MUX_PC_ctr(MUX_PC_ctr),
        .PC_plus4(PC_plus4),
        .RD_rs(Rd_rs),
        .ALU_result(ALU_result),
        .PC_Joint_result(PC_Joint_result),
        .exc_addr(exc_addr),
        .NPC(NPC)
    );
    
    wire [31:0] DMEM_HW_32;
    wire [31:0] DMEM_byte_32;
    Extend_8_32 ext_8_32(
        .DMEM_byte(DMEM_byte),
        .EXT8_sign_ctr(EXT8_sign_ctr),
        .DMEM_byte_32(DMEM_byte_32)
    );
    
    Extend_HW16_32 ext_hw16_32(
        .DMEM_HW(DMEM_HW),
        .EXTHW_sign_ctr(EXTHW_sign_ctr),
        .DMEM_HW_32(DMEM_HW_32)
    );
    
    wire [31:0] Rd_hi;
    wire [31:0] Rd_lo;
    wire [31:0] CP0_rdata;
    MUX_RF_Write mux_rf_write(
        .MUX_RF_Write_ctr(MUX_RF_Write_ctr),
        .ALU_result(ALU_result),
        .DMEM_WD(DMEM_WD),
        .DMEM_HW_32(DMEM_HW_32),
        .DMEM_byte_32(DMEM_byte_32),
        .PC_plus4(PC_plus4),
        .hi(Rd_hi),
        .lo(Rd_lo),
        .CP0_rdata(CP0_rdata),
        .RF_Write(Write)
    );
    
    
    
    wire [31:0] Write_hi;
    MUX_HI mux_hi(
        .MUX_HI_ctr(MUX_HI_ctr),
        .Rd_rs(Rd_rs),
        .ALU_hi(ALU_hi),
        .Write_hi(Write_hi)
    );
    
    wire [31:0] Write_lo;
    MUX_LO mux_lo(
        .MUX_LO_ctr(MUX_LO_ctr),
        .Rd_rs(Rd_rs),
        .ALU_lo(ALU_lo),
        .Write_lo(Write_lo)
    );

    HI_LO hi_lo(
        .rst(reset),
        .clk(clk_in),
        .Write_hi(Write_hi),
        .Write_lo(Write_lo),
        .Rd_hi(Rd_hi),
        .Rd_lo(Rd_lo),
        .HI_Write_ctr(HI_Write_ctr),
        .LO_Write_ctr(LO_Write_ctr)
    );
    
    wire exception;
    MUX_CP0_exc mux_cp0_exc(
        .exc_CU(exc_CU),
        .exception(exception),
        .MUX_CP0_exc_ctr(MUX_CP0_exc_ctr),
        .Rd_rs(Rd_rs),
        .Rd_rt(Rd_rt)
    );
    
    CP0 cp0(
        .clk(clk_in),
        .rst(reset),
        .eret(eret),
        .mfc0(mfc0),
        .mtc0(mtc0),
        .pc(Ins_add),
        .Rd(rd),
        .cause(cause),
        .wdata(Rd_rt),
        .exception(exception),
        .rdata(CP0_rdata),
        .exc_addr(exc_addr)
    );
    
endmodule
