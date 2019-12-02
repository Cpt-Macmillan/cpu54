`timescale 1ns / 1ps


module Control_Unit(
    input [5:0] func,
    input [5:0] op,
    output [4:0] ALU_ctr,
    output MUX_ALU_A_ctr,
    output MUX_ALU_B_ctr,
    output [2:0] MUX_PC_ctr,
    output [2:0] MUX_RF_Write_ctr,
    output [1:0] MUX_RF_rd_ctr,
    output EXT_sign_ctr,
    output RF_Write_ctr,
    output [1:0] DMEM_wri_ctr,
    output EXT8_sign_ctr,
    output EXTHW_sign_ctr,
    output MUX_HI_ctr,
    output MUX_LO_ctr,
    output HI_Write_ctr,
    output LO_Write_ctr,
    input [4:0] rs,
    output eret,
    output mfc0,
    output mtc0,
    output [4:0]cause,
    output exc_CU,
    output MUX_CP0_exc_ctr
    );
    reg [34:0] ctr;
    assign ALU_ctr = ctr[34:30];
    assign MUX_ALU_A_ctr = ctr[29];
    assign MUX_ALU_B_ctr = ctr[28];
    assign MUX_PC_ctr = ctr[27:25];
    assign MUX_RF_Write_ctr = ctr[24:22];
    assign MUX_RF_rd_ctr = ctr[21:20];
    assign EXT_sign_ctr = ctr[19];
    assign RF_Write_ctr = ctr[18];
    assign DMEM_wri_ctr = ctr[17:16];
    assign EXT8_sign_ctr = ctr[15];
    assign EXTHW_sign_ctr = ctr[14];
    assign MUX_HI_ctr = ctr[13];
    assign MUX_LO_ctr = ctr[12];
    assign HI_Write_ctr = ctr[11];
    assign LO_Write_ctr = ctr[10];
    assign eret = ctr[9];
    assign mfc0 = ctr[8];
    assign mtc0 = ctr[7];
    assign cause = ctr[6:2];
    assign exc_CU = ctr[1];
    assign MUX_CP0_exc_ctr = ctr[0];
    
    reg CP0_default = {1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//ctr[9:0]
    reg HI_LO_default = {1'bz,1'bz,1'b0,1'b0};//ctr[13:10];
    always @(func,op,rs) begin
        if(op == 6'b000000) begin
            case(func)
                ////////////////////.ALU..ALU_A.ALU_B..。PC...RFW...RFRd.EXT16.RFW..DW...EXT8..EXTHW//.....。HILO。。 //。。。。..。CP0。。....。。。//
                6'b100000: ctr <= {5'b00001,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //ADD
                6'b100001: ctr <= {5'b00000,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //ADDU
                6'b100010: ctr <= {5'b00011,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SUBU
                6'b100011: ctr <= {5'b00010,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SUB
                6'b100100: ctr <= {5'b00100,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//AND
                6'b100101: ctr <= {5'b00101,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //OR
                6'b100110: ctr <= {5'b00110,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //XOR
                6'b100111: ctr <= {5'b00111,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //NOR
                6'b101010: ctr <= {5'b01010,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SLT
                6'b101011: ctr <= {5'b01001,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SLTU
                6'b000100: ctr <= {5'b01100,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SLLV
                6'b000110: ctr <= {5'b01101,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SRLV
                6'b000111: ctr <= {5'b01011,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SRAV
                6'b000000: ctr <= {5'b01100,1'b1,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SLL
                6'b000010: ctr <= {5'b01101,1'b1,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SRL
                6'b000011: ctr <= {5'b01011,1'b1,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SRA
                6'b001000: ctr <= {5'bzzzzz,1'bz,1'bz,3'b001,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //JR
                
                6'b001001: ctr <= {5'bzzzzz,1'bz,1'bz,3'b001,3'b010,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //JALR
                
                ////////////////////.ALU...ALU_A.ALU_B..PC..RFWdata.RFWad.EXT16.RFW....DW**EXT8.EXTHW.MHI..MHO..HI..LO//。。。。..。CP0。。....。。。//
                6'b011010: ctr <= {5'b10001,1'b0,1'b0,3'b000,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //DIV
                6'b011011: ctr <= {5'b10010,1'b0,1'b0,3'b000,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //DIVU
                
                6'b011001: ctr <= {5'b10100,1'b0,1'b0,3'b000,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //MULTU
                6'b010000: ctr <= {5'bzzzzz,1'bz,1'bz,3'b000,3'b101,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //MFHI
                6'b010010: ctr <= {5'bzzzzz,1'bz,1'bz,3'b000,3'b110,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //MFLO
                6'b010001: ctr <= {5'bzzzzz,1'bz,1'bz,3'b000,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'b1,1'bz,1'b1,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //MTHI
                6'b010011: ctr <= {5'bzzzzz,1'bz,1'bz,3'b000,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'bz,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //MTLO
                ////////////////////.ALU...ALU_A.ALU_B..PC..RFWdataRFWadd.EXT16.RFW...DW**EXT8..EXTHW.MHI..MHO..HI.LO..eret mfc0 mtc0  cause  exc_CU Mexc
                6'b001101: ctr <= {5'bzzzzz,1'bz,1'bz,3'b100,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'b01001,1'b1,1'b0};//BREAK
                6'b001100: ctr <= {5'bzzzzz,1'bz,1'bz,3'b100,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'b01000,1'b1,1'b0};//SYSCALL
                6'b110100: ctr <= {5'bzzzzz,1'bz,1'bz,3'b100,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'b01101,1'bz,1'b1};//TEQ
            endcase
        end
        else begin
            case(op)
                6'b001000: ctr <= {5'b00001,1'b0,1'b1,3'b000,3'b000,2'b01,1'b1,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //ADDI
                6'b001001: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'b000,2'b01,1'b1,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //ADDIU
                6'b001100: ctr <= {5'b00100,1'b0,1'b1,3'b000,3'b000,2'b01,1'b0,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //ANDI
                6'b001101: ctr <= {5'b00101,1'b0,1'b1,3'b000,3'b000,2'b01,1'b0,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //ORI
                6'b001110: ctr <= {5'b00110,1'b0,1'b1,3'b000,3'b000,2'b01,1'b0,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //XORI
                6'b001111: ctr <= {5'b01000,1'bz,1'b1,3'b000,3'b000,2'b01,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //LUI 置于高位
                6'b001010: ctr <= {5'b01010,1'b0,1'b1,3'b000,3'b000,2'b01,1'b1,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SLTI
                6'b001011: ctr <= {5'b01001,1'b0,1'b1,3'b000,3'b000,2'b01,1'b0,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SLTIU
                6'b100011: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'b001,2'b01,1'b1,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //LW 读取内存 
                6'b101011: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'bzzz,2'bzz,1'b1,1'b0,2'b01,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //SW 写入内存
                6'b000100: ctr <= {5'b01110,1'b0,1'b0,3'b010,3'bzzz,2'bzz,1'b1,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //BEQ 相等跳转
                6'b000101: ctr <= {5'b01111,1'b0,1'b0,3'b010,3'bzzz,2'bzz,1'b1,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //BNE 不等跳转
                6'b000010: ctr <= {5'bzzzzz,1'bz,1'bz,3'b011,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //J
                6'b000011: ctr <= {5'bzzzzz,1'bz,1'bz,3'b011,3'b010,2'b10,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //JAL
                ////////////////////.ALU...ALU_A.ALU_B..PC....RFW...RFRd.EXT16.RFW..DW...EXT8..EXTHW.MHI..MHO..HI...LO eret mfc0 mtc0  cause  exc_CU Mexc
                6'b000001: ctr <= {5'b10000,1'b0,1'bz,3'b010,3'bzzz,2'bzz,1'b1,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//BGEZ
                6'b100100: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'b011,2'b01,1'b1,1'b1,2'b00,1'b0,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//LBU
                6'b100101: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'b100,2'b01,1'b1,1'b1,2'b00,1'bz,1'b0,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//LHU
                6'b100000: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'b011,2'b01,1'b1,1'b1,2'b00,1'b1,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//LB
                6'b100001: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'b100,2'b01,1'b1,1'b1,2'b00,1'bz,1'b1,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//LH
                6'b101000: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'bzzz,2'bzz,1'b1,1'b0,2'b11,1'b1,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//SB
                6'b101001: ctr <= {5'b00000,1'b0,1'b1,3'b000,3'bzzz,2'bzz,1'b1,1'b0,2'b10,1'bz,1'b1,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//SH
                6'b010000:
                case(rs)
                ////////////////////.ALU...ALU_A.ALU_B..PC..RFWdataRFWadd.EXT16.RFW...DW**EXT8..EXTHW.MHI..MHO..HI.LO..eret mfc0 mtc0  cause  exc_CU Mexc
                 5'b10000: ctr <= {5'bzzzzz,1'bz,1'bz,3'b100,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b1,1'b0,1'b0,5'bz,1'b0,1'b0};//ERET
                 5'b00000: ctr <= {5'bzzzzz,1'bz,1'bz,3'b000,3'b111,2'b01,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b1,1'b0,5'bz,1'b0,1'b0};//MFC0读CP0[rd]进Regfiles[rt]
                 5'b00100: ctr <= {5'bzzzzz,1'bz,1'bz,3'b000,3'bzzz,2'bzz,1'bz,1'b0,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b1,5'bz,1'b0,1'b0};//MTC0写CP0                 
                endcase
                6'b011100: 
                case(func)
                6'b100000: ctr <= {5'b10101,1'b0,1'bz,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0};//CLZ
                6'b000010: ctr <= {5'b10011,1'b0,1'b0,3'b000,3'b000,2'b00,1'bz,1'b1,2'b00,1'bz,1'bz,1'bz,1'bz,1'b0,1'b0,1'b0,1'b0,1'b0,5'bz,1'b0,1'b0}; //MUL
                endcase
            endcase
        end
    
    end
    
endmodule
