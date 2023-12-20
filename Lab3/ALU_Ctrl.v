module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o);

//I/O ports 
input      [4-1:0] funct_i;
input      [2-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;  
output     [2-1:0] FURslt_o;

//Internal Signals
wire		[4-1:0] ALU_operation_o;
wire		[2-1:0] FURslt_o; 
//Main function
assign { ALU_operation_o , FURslt_o } = ( ALUOp_i == 2'b00 ) ? 6'b0010_00 : // addi , lw , sw
                                        ( ALUOp_i == 2'b01 ) ? 6'b0110_00 : // beq , bne
                                        ( ALUOp_i == 2'b11 ) ? 6'b0000_11 : // lui  
                                        ( { ALUOp_i , funct_i } == 6'b10_0000 ) ? 6'b0010_00 : // add
                                        ( { ALUOp_i , funct_i } == 6'b10_0001 ) ? 6'b0110_00 : // sub
                                        ( { ALUOp_i , funct_i } == 6'b10_0010 ) ? 6'b0000_00 : // and
                                        ( { ALUOp_i , funct_i } == 6'b10_0011 ) ? 6'b0001_00 : // or
                                        ( { ALUOp_i , funct_i } == 6'b10_0100 ) ? 6'b1100_00 : // nor
                                        ( { ALUOp_i , funct_i } == 6'b10_0101 ) ? 6'b0111_00 : // slt
                                        ( { ALUOp_i , funct_i } == 6'b10_0110 ) ? 6'b000_1_01 : // sll , ALU_operation_o[0] => left/right = 1 (left) 
                                        ( { ALUOp_i , funct_i } == 6'b10_0111 ) ? 6'b000_0_01 : // srl , ALU_operation_o[0] => left/right = 0 (right) 
                                        6'bxxxx_xx;
endmodule
