module shifter_left( result, shamt, sftSrc );
    
  output wire[15:0] result;


  input wire[3:0] shamt;
  input wire[15:0] sftSrc;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  LEVEL 1 :     16     4 - to - 1 Muxs  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
  assign mux1_16 = ( shamt[3:2] == 2'b00 ) ? sftSrc[15] : ( shamt[3:2] == 2'b01 ) ? sftSrc[11] : ( shamt[3:2] == 2'b10 ) ? sftSrc[7] : ( shamt[3:2] == 2'b11 ) ? sftSrc[3] : 2'bxx;
  assign mux1_15 = ( shamt[3:2] == 2'b00 ) ? sftSrc[14] : ( shamt[3:2] == 2'b01 ) ? sftSrc[10] : ( shamt[3:2] == 2'b10 ) ? sftSrc[6] : ( shamt[3:2] == 2'b11 ) ? sftSrc[2] : 2'bxx;
  assign mux1_14 = ( shamt[3:2] == 2'b00 ) ? sftSrc[13] : ( shamt[3:2] == 2'b01 ) ? sftSrc[9] : ( shamt[3:2] == 2'b10 ) ? sftSrc[5] : ( shamt[3:2] == 2'b11 ) ? sftSrc[1] : 2'bxx;
  assign mux1_13 = ( shamt[3:2] == 2'b00 ) ? sftSrc[12] : ( shamt[3:2] == 2'b01 ) ? sftSrc[8] : ( shamt[3:2] == 2'b10 ) ? sftSrc[4] : ( shamt[3:2] == 2'b11 ) ? sftSrc[0] : 2'bxx;
  assign mux1_12 = ( shamt[3:2] == 2'b00 ) ? sftSrc[11] : ( shamt[3:2] == 2'b01 ) ? sftSrc[7] : ( shamt[3:2] == 2'b10 ) ? sftSrc[3] : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;               
  assign mux1_11 = ( shamt[3:2] == 2'b00 ) ? sftSrc[10] : ( shamt[3:2] == 2'b01 ) ? sftSrc[6] : ( shamt[3:2] == 2'b10 ) ? sftSrc[2] : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;
  assign mux1_10 = ( shamt[3:2] == 2'b00 ) ? sftSrc[9] : ( shamt[3:2] == 2'b01 ) ? sftSrc[5] : ( shamt[3:2] == 2'b10 ) ? sftSrc[1] : ( shamt[3:2] == 2'b11 ) ?1'b0 : 2'bxx;                  // if S3S2 == 11, sftSrc shift left 12 bits                                                                                                                                                                                                 
  assign mux1_9 = ( shamt[3:2] == 2'b00 ) ? sftSrc[8] : ( shamt[3:2] == 2'b01 ) ? sftSrc[4] : ( shamt[3:2] == 2'b10 ) ? sftSrc[0] : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;                  //             == 10, sftSrc shift left 8 bits
  assign mux1_8 = ( shamt[3:2] == 2'b00 ) ? sftSrc[7] : ( shamt[3:2] == 2'b01 ) ? sftSrc[3] : ( shamt[3:2] == 2'b10 ) ? 1'b0 : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;                       //             == 01, sftSrc shift left 4 bits 
  assign mux1_7 = ( shamt[3:2] == 2'b00 ) ? sftSrc[6] : ( shamt[3:2] == 2'b01 ) ? sftSrc[2] : ( shamt[3:2] == 2'b10 ) ? 1'b0 : ( shamt[3:2] == 2'b11 ) ? 1'b0: 2'bxx;                        //             == 00, sftSrc shift left 0 bits 
  assign mux1_6 = ( shamt[3:2] == 2'b00 ) ? sftSrc[5] : ( shamt[3:2] == 2'b01 ) ? sftSrc[1] : ( shamt[3:2] == 2'b10 ) ? 1'b0 : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;
  assign mux1_5 = ( shamt[3:2] == 2'b00 ) ? sftSrc[4] : ( shamt[3:2] == 2'b01 ) ? sftSrc[0] : ( shamt[3:2] == 2'b10 ) ? 1'b0 : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;
  assign mux1_4 = ( shamt[3:2] == 2'b00 ) ? sftSrc[3] : ( shamt[3:2] == 2'b01 ) ? 1'b0 : ( shamt[3:2] == 2'b10 ) ? 1'b0 : ( shamt[3:2] == 2'b11 ) ? 1'b0: 2'bxx;
  assign mux1_3 = ( shamt[3:2] == 2'b00 ) ? sftSrc[2] : ( shamt[3:2] == 2'b01 ) ? 1'b0 : ( shamt[3:2] == 2'b10 ) ? 1'b0 : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;
  assign mux1_2 = ( shamt[3:2] == 2'b00 ) ? sftSrc[1] : ( shamt[3:2] == 2'b01 ) ? 1'b0 : ( shamt[3:2] == 2'b10 ) ?  1'b0 : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;
  assign mux1_1 = ( shamt[3:2] == 2'b00 ) ? sftSrc[0] : ( shamt[3:2] == 2'b01 ) ? 1'b0 : ( shamt[3:2] == 2'b10 ) ? 1'b0 : ( shamt[3:2] == 2'b11 ) ? 1'b0 : 2'bxx;
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  LEVEL 2 :     16     4 - to - 1 Muxs  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  assign result[15]= ( shamt[1:0] == 2'b00 ) ? mux1_16 : ( shamt[1:0]== 2'b01 ) ? mux1_15: ( shamt[1:0]== 2'b10 ) ? mux1_14 : ( shamt[1:0] == 2'b11 ) ? mux1_13 : 2'bxx; 
  assign result[14]= ( shamt[1:0] == 2'b00 ) ? mux1_15 : ( shamt[1:0]== 2'b01 ) ? mux1_14 : ( shamt[1:0]== 2'b10 ) ? mux1_13 : ( shamt[1:0] == 2'b11 ) ? mux1_12 : 2'bxx;
  assign result[13]= ( shamt[1:0] == 2'b00 ) ? mux1_14 : ( shamt[1:0]== 2'b01 ) ? mux1_13 : ( shamt[1:0]== 2'b10 ) ? mux1_12  : ( shamt[1:0] == 2'b11 ) ? mux1_11 : 2'bxx;
  assign result[12]= ( shamt[1:0] == 2'b00 ) ? mux1_13 : ( shamt[1:0]== 2'b01 ) ? mux1_12 : ( shamt[1:0]== 2'b10 ) ? mux1_11  : ( shamt[1:0] == 2'b11 ) ? mux1_10 : 2'bxx;
  assign result[11]= ( shamt[1:0] == 2'b00 ) ? mux1_12 : ( shamt[1:0]== 2'b01 ) ? mux1_11 : ( shamt[1:0]== 2'b10 ) ? mux1_10  : ( shamt[1:0] == 2'b11 ) ? mux1_9 : 2'bxx;
  assign result[10]= ( shamt[1:0] == 2'b00 ) ? mux1_11 : ( shamt[1:0]== 2'b01 ) ? mux1_10 : ( shamt[1:0]== 2'b10 ) ? mux1_9  : ( shamt[1:0] == 2'b11 ) ? mux1_8 : 2'bxx;                  // if S1S0 == 11, sftSrc shift left 1 bits 
  assign result[9]= ( shamt[1:0] == 2'b00 ) ? mux1_10 : ( shamt[1:0]== 2'b01 ) ? mux1_9 : (shamt[1:0] == 2'b10 ) ? mux1_8  : ( shamt[1:0] == 2'b11 ) ? mux1_7 : 2'bxx;                    //             == 10, sftSrc shift left 2 bits  
  assign result[8]= ( shamt[1:0] == 2'b00 ) ? mux1_9 : ( shamt[1:0]== 2'b01 ) ? mux1_8 : (shamt[1:0] == 2'b10 ) ? mux1_7 : ( shamt[1:0] == 2'b11 ) ? mux1_6 : 2'bxx;                      //             == 01, sftSrc shift left 1 bits  
  assign result[7]= ( shamt[1:0] == 2'b00 ) ? mux1_8 : ( shamt[1:0]== 2'b01 ) ? mux1_7 : (shamt[1:0] == 2'b10 ) ? mux1_6 : ( shamt[1:0] == 2'b11 ) ? mux1_5 : 2'bxx;                      //             == 00, sftSrc shift left 0 bits  
  assign result[6] = ( shamt[1:0] == 2'b00 ) ? mux1_7 : (shamt[1:0] == 2'b01 ) ? mux1_6 : ( shamt[1:0] == 2'b10 ) ? mux1_5 : ( shamt[1:0] == 2'b11 ) ? mux1_4: 2'bxx; 
  assign result[5] = ( shamt[1:0] == 2'b00 ) ? mux1_6 : ( shamt[1:0] == 2'b01 ) ? mux1_5 : ( shamt[1:0] == 2'b10 ) ? mux1_4 : ( shamt[1:0] == 2'b11 ) ? mux1_3 : 2'bxx;
  assign result[4] = ( shamt[1:0] == 2'b00 ) ? mux1_5 : ( shamt[1:0] == 2'b01 ) ? mux1_4 : ( shamt[1:0] == 2'b10 ) ? mux1_3 : ( shamt[1:0] == 2'b11 ) ? mux1_2 : 2'bxx;
  assign result[3] = ( shamt[1:0] == 2'b00 ) ? mux1_4 : ( shamt[1:0] == 2'b01 ) ? mux1_3 : ( shamt[1:0] == 2'b10 ) ? mux1_2 : ( shamt[1:0] == 2'b11 ) ? mux1_1: 2'bxx;
  assign result[2] = ( shamt[1:0] == 2'b00 ) ? mux1_3 : ( shamt[1:0] == 2'b01 ) ? mux1_2 : ( shamt[1:0] == 2'b10 ) ? mux1_1 : ( shamt[1:0] == 2'b11 ) ? 1'b0 : 2'bxx;
  assign result[1] = ( shamt[1:0] == 2'b00 ) ? mux1_2 : ( shamt[1:0] == 2'b01 ) ? mux1_1 : ( shamt[1:0] == 2'b10 ) ?  1'b0 : ( shamt[1:0] == 2'b11 ) ? 1'b0 : 2'bxx;
  assign result[0] = ( shamt[1:0] == 2'b00 ) ? mux1_1 : ( shamt[1:0] == 2'b01 ) ? 1'b0 : ( shamt[1:0] == 2'b10 ) ? 1'b0 : ( shamt[1:0] == 2'b11 ) ? 1'b0 : 2'bxx;
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
  endmodule