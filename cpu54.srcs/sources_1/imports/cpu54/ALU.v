`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module ALU( 
    input [31:0] A,
    input [31:0] B,
    input [4:0] ALU_ctr,//update: 改为五位
    input [31:0] imm,
    input [31:0] PC_plus4,
    output reg [31:0] ALU_hi,
    output reg [31:0] ALU_lo,
    output reg [31:0] result
    );
    integer i; // CLZ用
    integer j;
    integer max;
    always @(*) begin
        case(ALU_ctr)
            5'b00000: result <= $signed(A) + $signed(B);                //ADDU
            5'b00001: result <= $signed(A) + $signed(B);                //ADD
            5'b00010: result <= A - B;                                    //SUBU
            5'b00011: result <= A - B;                                    //SUB
            5'b00100: result <= A & B;                                    //AND
            5'b00101: result <= A | B;                                    //OR
            5'b00110: result <= A ^ B;                                    //XOR
            5'b00111: result <= ~(A|B);                                   //NOR
            5'b01000: result <= {B[15:0], 16'b0};                         //LUI
            5'b01001: result <= (A < B) ? 1 : 0;                          //SLTU
            5'b01010: result <= ($signed(A)<$signed(B)) ? 1 : 0;        //SLT
            5'b01011: result <= $signed(B) >>> A;                        //SRA 向右算术移位
            5'b01100: result <= B << A;                                   // SLL, SLR
            5'b01101: result <= B >> A;                                   //SRL 向右逻辑移位
            5'b01110: result <= (B == A) ? PC_plus4 + (imm<<2) : PC_plus4;//BEQ 跳转地址
            5'b01111: result <= (B != A) ? PC_plus4 + (imm<<2) : PC_plus4;//BNE 跳转地址
            
            5'b10000: result <= ($signed(A)>=0) ? PC_plus4 + (imm<<2) : PC_plus4; //BGEZ 生成跳转地址
            5'b10001: {ALU_hi, ALU_lo} <= {$signed(A) % $signed(B), $signed(A) / $signed(B)};//DIV
            5'b10010: {ALU_hi, ALU_lo} <= {A % B, A / B};//DIVU
            5'b10011: result <= $signed(A) * $signed(B);// MUL
            5'b10100: {ALU_hi, ALU_lo} <= A * B; //MULTU
            5'b10101:begin//CLZ
                j = 0;max = 0;
                for(i = 31; i >= 0;i = i-1) begin
                    if(A[i]==1'b1) begin
                        j = 1;
                    end
                    if(!j) begin
                        max = max + 1;
                    end
                end
                result <= max;
            end 
        endcase
    end
endmodule
