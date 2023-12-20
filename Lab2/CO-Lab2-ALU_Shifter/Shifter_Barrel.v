module Shifter_Barrel( result, leftRight, shamt, sftSrc );
    
  output wire[15:0] result;

  input wire leftRight;
  input wire[3:0] shamt;
  input wire[15:0] sftSrc;
  wire [15:0] r_right;
  wire [15:0] r_left;
 
 ///////////////////////////////////////////////////////////////   16bits_shifter ///////////////////////////////////////////////////////////////
  shifter_right shifter_right_1( r_right , shamt , sftSrc);  // " r_right " is  the result of shifting right
  shifter_left shifter_left_1( r_left , shamt , sftSrc);     // " r_left " is the result of shifting left
  
  assign result = leftRight ? r_left : r_right;   //  according to leftRight to choose r_left or r_right
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
  endmodule