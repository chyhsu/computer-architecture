module IF_ID_Stage( clk_i, rst_n , PC , Instr , IF_ID_Hold , IF_ID_Flush ,
                        PC_o , Instr_o );

input           clk_i;
input           rst_n;
input[15:0]     PC;
input[15:0]     Instr;
input           IF_ID_Hold;
input           IF_ID_Flush;

output[15:0]    PC_o;
output[15:0]    Instr_o;        

reg[15:0]       PC_o;
reg[15:0]       Instr_o;

always @ (posedge clk_i ) begin
    if( ~rst_n | IF_ID_Flush) begin
        PC_o <=  0;
        Instr_o <= 0;
    end
    else begin
        if( ~IF_ID_Hold)
            begin
                PC_o <= PC;
                Instr_o <= Instr;
            end
    end
end
endmodule