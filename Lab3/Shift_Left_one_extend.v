module Shift_Left_one_extend( data_i, data_o );

//I/O ports                    
input  [13-1:0] data_i;
output [14-1:0] data_o;
wire   [14-1:0] data_o;

//shift left
assign data_o = { data_i , 1'b0 };

endmodule
