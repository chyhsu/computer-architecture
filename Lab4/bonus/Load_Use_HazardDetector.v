module Load_Use_HazardDetector(MemWrite , ID_EX_MemRead , RDaddr , IF_ID_RS , IF_ID_RT , PC_Hold , IF_ID_Hold , ID_EX_Flush) ;

input          MemWrite;
input          ID_EX_MemRead;
input [2:0]    RDaddr;
input [2:0]    IF_ID_RS;
input [2:0]    IF_ID_RT;

output         PC_Hold;
output         IF_ID_Hold;
output         ID_EX_Flush;

assign { PC_Hold , IF_ID_Hold , ID_EX_Flush } = ( ID_EX_MemRead & 
                                                    ~MemWrite &
                                                  ( RDaddr == IF_ID_RS | RDaddr== IF_ID_RT ) ) ? 3'b111 :3'b000 ;
                                                  
endmodule