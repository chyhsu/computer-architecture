module MEM_WB_Stage( clk_i , rst_n ,WB , Mem_data , ALU_result , Write_dst ,
                                       WB_o , Mem_data_o , ALU_result_o ,Write_dst_o);
input clk_i;
input rst_n;                     

input [1:0]     WB;
input [15:0]    Mem_data;
input [15:0]    ALU_result;
input [2:0]     Write_dst;      

output reg [1:0]     WB_o;
output reg [15:0]    Mem_data_o;
output reg [15:0]    ALU_result_o;
output reg [2:0]     Write_dst_o;            

always @ (posedge clk_i ) begin
    if( ~rst_n ) begin
       WB_o <= 0;         
       Mem_data_o <= 0;   
       ALU_result_o <= 0; 
       Write_dst_o <= 0; 
    end
    else begin
        WB_o <= WB;        
        Mem_data_o <= Mem_data;  
        ALU_result_o <= ALU_result;
        Write_dst_o <= Write_dst; 
    end
end

endmodule