module  Data_hazard_detector( IF_ID_RS , IF_ID_RT , ID_EX_RD , EX_MEM_RD , ID_EX_RegWrite , EX_MEM_RegWrite , ID_EX_Flush ,  IF_ID_Hold , PC_Hold );

input [2:0]   IF_ID_RS;
input [2:0]   IF_ID_RT;
input [2:0]   ID_EX_RD;
input [2:0]   EX_MEM_RD;
input         ID_EX_RegWrite;
input         EX_MEM_RegWrite;

output        IF_ID_Hold;
output        ID_EX_Flush;
output        PC_Hold;

assign { ID_EX_Flush , PC_Hold ,IF_ID_Hold} = ( 
                                     ( 
                                        ID_EX_RegWrite & 
                                        ( ID_EX_RD == IF_ID_RS |ID_EX_RD == IF_ID_RT )&
                                        ID_EX_RD != 0
                                     ) 
                                     
                                     | 
                                     ( 
                                        EX_MEM_RegWrite & 
                                        ( EX_MEM_RD == IF_ID_RS | EX_MEM_RD == IF_ID_RT ) &
                                        EX_MEM_RD != 0
                                      ) 
                                   ) ? 3'b111 : 3'b000;



endmodule
