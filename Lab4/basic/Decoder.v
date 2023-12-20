module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o, Branch_o, BranchType_o, MemToReg_o, MemRead_o, MemWrite_o, Jump_o );
     
//I/O ports
input	[3-1:0] instr_op_i;


output			RegWrite_o;
output	[2-1:0] ALUOp_o;
output			ALUSrc_o;
output	        RegDst_o;
output			Branch_o;
output			BranchType_o;
output			MemToReg_o;
output			MemRead_o;
output			MemWrite_o; 
output		    Jump_o;

//Internal Signals
wire			RegWrite_o;
wire	[2-1:0] ALUOp_o;
wire			ALUSrc_o;
wire	        RegDst_o;
wire			Branch_o;
wire			BranchType_o;
wire			MemToReg_o;
wire			MemRead_o;
wire			MemWrite_o; 
wire			Jump_o;

//Main function
assign { RegWrite_o , 
         ALUOp_o , 
         ALUSrc_o ,
          RegDst_o , 
          Branch_o , 
          BranchType_o , 
          MemToReg_o , 
          MemRead_o , 
          MemWrite_o , 
          Jump_o } =  ( instr_op_i == 3'b000 ) ? 11'b1_10_0_1_0_0_0_0_0_0 : // R-type
                      ( instr_op_i == 3'b001 ) ? 11'b1_00_1_0_0_0_0_0_0_0 : // addi
                      ( instr_op_i == 3'b010 ) ? 11'b1_11_0_0_0_0_0_0_0_0 : // lui
                      ( instr_op_i == 3'b011 ) ? 11'b1_00_1_0_0_0_1_1_0_0 : // lw
                      ( instr_op_i == 3'b100 ) ? 11'b0_00_1_0_0_0_0_0_1_0 : // sw
                      ( instr_op_i == 3'b101 ) ? 11'b0_01_0_0_1_0_0_0_0_0 : // beq
                      ( instr_op_i == 3'b110 ) ? 11'b0_01_0_0_1_1_0_0_0_0 : // bne
                      ( instr_op_i == 3'b111 ) ? 11'b0_00_0_0_0_0_0_0_0_1 : // jump
                      11'bxxxxxxxxxxx;
endmodule
