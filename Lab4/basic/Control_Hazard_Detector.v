module Control_Hazard_Detector( Branch , Jump , IF_ID_Flush , ID_EX_Flush );

input Branch;
input Jump;

output IF_ID_Flush;
output ID_EX_Flush;

assign { IF_ID_Flush , ID_EX_Flush } = ( Branch == 1'b1 | Jump == 1'b1) ? 2'b11 : 2'b00;


endmodule
