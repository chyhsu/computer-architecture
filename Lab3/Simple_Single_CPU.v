module Simple_Single_CPU( clk_i, rst_n );
		
//I/O port
input         clk_i;
input         rst_n;

//Internal Signles
wire [16-1:0] PC_in;
wire [16-1:0] PC_ReadAddress;
wire [16-1:0] PCadder1_sum;
wire [16-1:0] PCadder2_sum;
wire [16-1:0] Instruction;
wire  [3-1:0] RDaddr;
wire [16-1:0] RDdata;
wire [16-1:0] RSdata;
wire [16-1:0] RTdata;

//Decoder
wire 	        RegDst;
wire 		RegWrite;
wire	[2-1:0] ALUOp;
wire	        ALUSrc;
wire	        Branch;
wire		MemtoReg;
wire		BranchType;
wire		Jump;
wire		MemRead;
wire		MemWrite;

//AC
wire  [4-1:0] ALU_operation;
wire  [2-1:0] FUResult_Select;
wire [16-1:0] FUResult;

//ALU
wire [16-1:0] SignExtend; 
wire [16-1:0] ALU_src2;
wire Zero;
wire Overflow;
wire [16-1:0] ALU_result;

//DM
wire [16-1:0] Mem_Readdata;

//branch
wire ZERO;
wire PCSrc;

//ZF
wire [16-1:0] ZeroFilled;

//shifter
wire [16-1:0] Shifter_result;

//PC
wire [16-1:0] SE_shiftleft1;
wire [16-1:0] PC_branch;
wire [14-1:0] Jump_shiftleft1;
wire [16-1:0] PC_jump;

//module
Program_Counter PC(
        .clk_i(clk_i),      
        .rst_n(rst_n),     
        .pc_in_i(PC_in) ,   
        .pc_out_o(PC_ReadAddress) 
        );
	
Instr_Memory IM(
        .pc_addr_i(PC_ReadAddress),  
        .instr_o(Instruction)    
        );
	
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(Instruction[12:10]) ,  
        .RTaddr_i(Instruction[9:7]) ,  
        .RDaddr_i(RDaddr) ,  
        .RDdata_i(RDdata)  , 
        .RegWrite_i(RegWrite),
        .RSdata_o(RSdata) ,  
        .RTdata_o(RTdata)
        );

Data_Memory DM(
        .clk_i(clk_i),
        .addr_i(FUResult),
        .data_i(RTdata),
        .MemRead_i(MemRead),
        .MemWrite_i(MemWrite),
        .data_o(Mem_Readdata)
        );

/////////////////////////////////////////////////////////////////////////////////////// Decorder
Decoder decoder(  Instruction[15:13] ,          ///
                  RegWrite ,                    ///
                  ALUOp ,                       ///
                  ALUSrc ,                      ///
                  RegDst ,                      ///
                  Branch ,                      ///
                  BranchType ,                  ///
                  MemtoReg ,                    ///
                  MemRead ,                     ///
                  MemWrite ,                    ///
                  Jump );                       ///
///////////////////////////////////////////////////////////////////////////////////////
        
        
//////////////////////////////////////////////////////////////////////////////////////// RegDst 
Mux2to1_3bits regdst_mux( Instruction[9:7] ,    ///
                          Instruction[6:4] ,    ///
                          RegDst ,              ///
                          RDaddr );             ///  
///////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////// Sign_Extend
Sign_Extend sign_extend( Instruction[6:0] ,     ///
                         SignExtend ) ;         ///
///////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////// ALUSrc
Mux2to1 alusrc_mux( RTdata ,                     ///
                    SignExtend ,                 ///
                    ALUSrc ,                     ///
                    ALU_src2 ) ;                 ///
/////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////// ALU 
ALU alu(  RSdata ,                          ///
              ALU_src2 ,                        ///
              ALU_operation ,                   ///
              ALU_result ,                      ///
              Zero ,                            ///
              Overflow ) ;                      ///
///////////////////////////////////////////////////////////////////////////////////////       


//////////////////////////////////////////////////////////////////////////////////////// ALU_Ctrl 
ALU_Ctrl alu_ctrl( Instruction[3:0] ,           ///
                   ALUOp ,                      ///
                   ALU_operation ,              ///
                   FUResult_Select);            ///
///////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////// Zerofilled
Zero_Filled zerofilled( Instruction[6:0] ,      ///
                        ZeroFilled );           ///
///////////////////////////////////////////////////////////////////////////////////////                   


//////////////////////////////////////////////////////////////////////////////////////// Shifter 
Shifter shifter( Shifter_result ,               /// 
                 ALU_operation[0] ,             ///
                 ALU_src2 );                    ///
///////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////  FUResult_mux 
Mux3to1 furesult_mux( ALU_result ,              ///
                      Shifter_result ,          ///
                      ZeroFilled ,              ///
                      FUResult_Select ,         ///
                      FUResult );               ///
///////////////////////////////////////////////////////////////////////////////////////                        


/////////////////////////////////////////////////////////////////////////////////////// MemToReg_mux
Mux2to1 memtoreg_mux( FUResult ,               ///
                      Mem_Readdata ,           ///
                      MemtoReg ,               ///
                      RDdata) ;                ///
//////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////// BranchType_mux
not ( _Zero , Zero );                          ///
Mux2to1_1bit branchtype_mux( Zero ,            ///
                             _Zero ,           ///
                             BranchType ,      ///
                             ZERO );           ///
/////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////// Adder_1
Adder adder_1( PC_ReadAddress ,              ///
                16'b0000000000000010 ,                           ///
                PCadder1_sum);                ///
////////////////////////////////////////////////////////////////////////////////////                


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Shift_Left_one_extend
Shift_Left_one_extend shift_left_one_extend( Instruction[12:0] , ///
                                             Jump_shiftleft1 );  ///
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////// Shift_left_one
Shift_Left_one shift_left_one( SignExtend ,       ///
                               SE_shiftleft1 );   ///
///////////////////////////////////////////////////////////////////////////////////////////                            


///////////////////////////////////////////////////////////////////////////////////////////   Adder_2
 Adder adder_2( PCadder1_sum ,                    ///
                SE_shiftleft1 ,                   ///
                PCadder2_sum );                   ///
///////////////////////////////////////////////////////////////////////////////////////////                   
 
 
////////////////////////////////////////////////////////////////////////////////////// Branch_mux
assign PCSrc = Branch & ZERO;                   ///
Mux2to1 branch_mux( PCadder1_sum ,             ///
                    PCadder2_sum ,             ///
                    PCSrc ,                    ///
                    PC_branch );               ///
/////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////// jump_mux
Mux2to1 jump_mux(  PC_branch ,                             ///
                   {PCadder1_sum[15:14],Jump_shiftleft1} , ///
                   Jump ,                                  ///
                   PC_in );                                ///
//////////////////////////////////////////////////////////////////////////////////////////////////////////
endmodule

