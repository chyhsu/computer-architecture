module EX_ForwardingUnit( EX_MEM_RDaddr ,   
                           MEM_WB_RDaddr ,    
                           ID_EX_RS_reg ,     
                           ID_EX_RT_reg ,     
                           EX_MEM_RegWrite ,     
                           MEM_WB_RegWrite ,     
                           Forward_A ,        
                           Forward_B );       

input  [2:0] EX_MEM_RDaddr;
input  [2:0] MEM_WB_RDaddr;
input  [2:0] ID_EX_RS_reg;
input  [2:0] ID_EX_RT_reg;
input        EX_MEM_RegWrite;
input        MEM_WB_RegWrite;

output  [2:0] Forward_A ;
output  [2:0] Forward_B ;

assign Forward_A = ( EX_MEM_RegWrite & (EX_MEM_RDaddr != 0) & (ID_EX_RS_reg == EX_MEM_RDaddr) ) ? 2'b10 :
                   ( ~( EX_MEM_RegWrite & (EX_MEM_RDaddr != 0) & (ID_EX_RS_reg == EX_MEM_RDaddr) ) & MEM_WB_RegWrite & (MEM_WB_RDaddr != 0) & (ID_EX_RS_reg == MEM_WB_RDaddr) ) ? 2'b01 :
                    2'b00;
assign Forward_B = ( EX_MEM_RegWrite & (EX_MEM_RDaddr != 0) & (ID_EX_RT_reg == EX_MEM_RDaddr) ) ? 2'b10 :
                   ( ~( EX_MEM_RegWrite & (EX_MEM_RDaddr != 0) & (ID_EX_RT_reg == EX_MEM_RDaddr) ) & MEM_WB_RegWrite & (MEM_WB_RDaddr != 0) & (ID_EX_RT_reg == MEM_WB_RDaddr) ) ? 2'b01 :
                    2'b00;

endmodule