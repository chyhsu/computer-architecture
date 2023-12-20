module ALU(  aluSrc1, aluSrc2 , ALU_operation_i , result , zero , overflow  );
  
 
  output wire[15:0] result;
  output wire zero;
  output wire overflow;

  input wire[15:0] aluSrc1;
  input wire[15:0] aluSrc2;
  input wire[4-1:0] ALU_operation_i;
  

  assign invertA = ALU_operation_i[3];
  assign invertB = ALU_operation_i[2];
  
  wire or_zero ;
  
  //////////////////////////////////////////////////////////////////////////////  ALU  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ALU_1bit   alu_1bit_0( result[0] , cout0 , aluSrc1[0] , aluSrc2[0] , invertA , invertB , ALU_operation_i[1:0] , invertB , set);                                       // " less " is the " set "  of MSB
  ALU_1bit   alu_1bit_1( result[1] , cout1 , aluSrc1[1] , aluSrc2[1] , invertA , invertB , ALU_operation_i[1:0] , cout0 , 1'b0); 
  ALU_1bit   alu_1bit_2( result[2] , cout2 , aluSrc1[2] , aluSrc2[2] , invertA , invertB , ALU_operation_i[1:0] , cout1 , 1'b0); 
  ALU_1bit   alu_1bit_3( result[3] , cout3 , aluSrc1[3] , aluSrc2[3] , invertA , invertB , ALU_operation_i[1:0] , cout2 , 1'b0); 
  ALU_1bit   alu_1bit_4( result[4] , cout4 , aluSrc1[4] , aluSrc2[4] , invertA , invertB , ALU_operation_i[1:0] , cout3 , 1'b0); 
  ALU_1bit   alu_1bit_5( result[5] , cout5 , aluSrc1[5] , aluSrc2[5] , invertA , invertB , ALU_operation_i[1:0] , cout4 , 1'b0); 
  ALU_1bit   alu_1bit_6( result[6] , cout6 , aluSrc1[6] , aluSrc2[6] , invertA , invertB , ALU_operation_i[1:0] , cout5 , 1'b0); 
  ALU_1bit   alu_1bit_7( result[7] , cout7 , aluSrc1[7] , aluSrc2[7] , invertA , invertB , ALU_operation_i[1:0] , cout6 , 1'b0); 
  ALU_1bit   alu_1bit_8( result[8] , cout8 , aluSrc1[8] , aluSrc2[8] , invertA , invertB , ALU_operation_i[1:0] , cout7 , 1'b0); 
  ALU_1bit   alu_1bit_9( result[9] , cout9 , aluSrc1[9] , aluSrc2[9] , invertA , invertB , ALU_operation_i[1:0] , cout8 , 1'b0);
  ALU_1bit   alu_1bit_10( result[10] , cout10 , aluSrc1[10] , aluSrc2[10] , invertA , invertB , ALU_operation_i[1:0] , cout9 , 1'b0);
  ALU_1bit   alu_1bit_11( result[11] , cout11 , aluSrc1[11] , aluSrc2[11] , invertA , invertB , ALU_operation_i[1:0] , cout10 , 1'b0); 
  ALU_1bit   alu_1bit_12( result[12] , cout12 , aluSrc1[12] , aluSrc2[12] , invertA , invertB , ALU_operation_i[1:0] , cout11 , 1'b0); 
  ALU_1bit   alu_1bit_13( result[13] , cout13 , aluSrc1[13] , aluSrc2[13] , invertA , invertB , ALU_operation_i[1:0] , cout12 , 1'b0); 
  ALU_1bit   alu_1bit_14( result[14] , cout14 , aluSrc1[14] , aluSrc2[14] , invertA , invertB , ALU_operation_i[1:0] , cout13 , 1'b0); 
  ALU_1bit_special_adv alu_1bit_15( set, overflow , result[15] , cout15 , aluSrc1[15] , aluSrc2[15] , invertA , invertB , ALU_operation_i[1:0] , cout14 , 1'b0);   // the MSB, using the special alu_1bit with " overflow " , "  set  " 
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 

  ////////////////////////////////////////////////////////////////////////////  zero  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  or   or1( or_zero, result[0] , result[1] , result[2] , result[3] , result[4] , result[5] , result[6] , result[7] , result[8] , result[9] ,result[10] ,result[11] , result[12] 
  , result[13] , result[14] ,result[15]) ;
  not not1(zero, or_zero);             //  check if all bits are zero
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
endmodule