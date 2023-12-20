module Shifter( result, leftRight, sftSrc );

//I/O ports 
output	[16-1:0] result;

input			leftRight;
input	[16-1:0] sftSrc ;

//Internal Signals
wire	[16-1:0] result;
  
//Main function
assign result = ( leftRight == 1'b0 ) ? sftSrc >> 1 :
                ( leftRight == 1'b1 ) ? sftSrc << 1 :
                16'bxxxxxxxxxxxxxxxx;

endmodule