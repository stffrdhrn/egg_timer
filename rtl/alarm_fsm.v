module alarm_fsm
  #(parameter             SIZE = 4)
 
  (input                 rst,
   input                 sec_clk,
   input                 enable,
	input  [SIZE-1:0]     max,
	output [SIZE-1:0]     count,
	output                alarm);
	
reg       [SIZE-1:0]  count_ff;
reg                   alarm_ff;
reg                   alarm_nxt;

assign count = count_ff;
assign alarm = alarm_ff;
	
always @ (*)
begin
  if (rst) begin
    alarm_nxt = 1'b0;
  end
  else if (enable && (max == count)) begin     
    alarm_nxt = 1'b1;
  end
  else 
    alarm_nxt = alarm_ff;  
end
	
always @ (posedge sec_clk or posedge rst)
  if (rst) begin
     count_ff <= {SIZE{1'b0}};
     alarm_ff <= 1'b0;
  end
  else begin
     count_ff <= count_ff + 1'b1;
     alarm_ff <= alarm_nxt;
  end
	 	
endmodule
