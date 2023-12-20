module MEM_ForwardingUnit( MEM_WB_MemtoReg , EX_MEM_MemWrite , EX_MEM_RTaddr , MEM_WB_RDaddr , MEM_Forward );

input MEM_WB_MemtoReg ;
input EX_MEM_MemWrite ;
input [2:0] EX_MEM_RTaddr ;
input [2:0] MEM_WB_RDaddr ;

output MEM_Forward ; 

assign MEM_Forward = ( MEM_WB_MemtoReg & EX_MEM_MemWrite & ( EX_MEM_RTaddr == MEM_WB_RDaddr)) ? 1'b1 : 1'b0;

endmodule