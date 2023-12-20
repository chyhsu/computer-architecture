module EX_MEM_Stage( clk_i , rst_n , WB , MEM  , FU_result , RT_data , Write_dst , RT_addr ,
                                      WB_o , MEM_o , FU_result_o , RT_data_o , Write_dst_o , RT_addr_o);

input           clk_i;
input           rst_n;

input [1:0]     WB;
input [1:0]     MEM;
input[15:0]     FU_result;
input[15:0]     RT_data;
input[2:0]      Write_dst;           
input[2:0]      RT_addr ;

output reg   [1:0]     WB_o;
output reg   [1:0]     MEM_o;
output reg   [15:0]    FU_result_o;
output reg   [15:0]    RT_data_o;
output reg   [2:0]     Write_dst_o;                                    
output reg   [2:0]     RT_addr_o;

always @ (posedge clk_i ) begin
    if( ~rst_n ) begin
         WB_o <= 0;         
         MEM_o <= 0;        
         FU_result_o <= 0; 
         RT_data_o <= 0;    
         Write_dst_o <= 0;  
         RT_addr_o <= 0;
    end
    else begin
        WB_o <= WB;         
        MEM_o <= MEM;        
        FU_result_o <= FU_result; 
        RT_data_o <= RT_data;    
        Write_dst_o <= Write_dst;  
        RT_addr_o <= RT_addr;
    end
end

endmodule