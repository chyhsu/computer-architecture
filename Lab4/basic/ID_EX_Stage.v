module ID_EX_Stage( clk_i , rst_n , 
                       Data_ID_EX_Flush , Branch_ID_EX_Flush ,
                           EX , MEM , WB , jump_dst ,PC , RS_data , RT_data , SE , Zerofilled , func, RT_reg , RD_reg ,
                                     EX_o , MEM_o , WB_o ,jump_dst_o , PC_o , RS_data_o , RT_data_o , SE_o , Zerofilled_o , func_o,RT_reg_o , RD_reg_o );
                     
input clk_i;
input rst_n;                     
input Data_ID_EX_Flush;
input Branch_ID_EX_Flush ;                     
input[1:0]  WB;
input[1:0]  MEM;
input[6:0]  EX;
input[12:0] jump_dst;
input[15:0]  PC;
input[15:0]  RS_data;
input[15:0]  RT_data;
input[15:0] Zerofilled;
input[3:0] func;
input[15:0] SE;
input[2:0] RT_reg;
input[2:0] RD_reg;

output reg   [1:0]  WB_o;
output reg   [1:0]  MEM_o;
output reg   [6:0]  EX_o;
output reg   [12:0] jump_dst_o;       
output reg   [15:0] PC_o;

output reg   [15:0] RS_data_o;
output reg   [15:0] RT_data_o;
output reg   [15:0] Zerofilled_o;
output reg   [3:0]  func_o;
output reg   [15:0] SE_o;

output reg   [2:0] RT_reg_o;
output reg   [2:0] RD_reg_o;


always @ (posedge clk_i )
begin
    if( ~rst_n | Data_ID_EX_Flush | Branch_ID_EX_Flush)
 begin
        WB_o <= 2'b00;     
        MEM_o <= 2'b00;    
        EX_o <= 6'b000000;     
        jump_dst_o <=0 ;
        PC_o <= 0;     
        
        RS_data_o <= 0;
        RT_data_o <= 0;
        SE_o <= 0;     
        Zerofilled_o <= 0;
        func_o <=0 ;
      
        RT_reg_o <= 0; 
        RD_reg_o <= 0; 
        end
    else begin
        WB_o <= WB;     
        MEM_o <= MEM;    
        EX_o <= EX;     
        jump_dst_o <= jump_dst ;
        PC_o <= PC;     
       
        RS_data_o <= RS_data;
        RT_data_o <= RT_data;
        SE_o <= SE;     
        Zerofilled_o <= Zerofilled;
        func_o <= func ;
       
        RT_reg_o <= RT_reg; 
        RD_reg_o <= RD_reg; 
    end
end

endmodule
