module controller_fsm 
  #(parameter             SIZE = 4)
 
  (input                 rst,
   input                 start,
   input                 clk,
	output                is_counting,
	output                sec_clk);

localparam COUNT_SIZE = 19;
	
reg                     is_counting_ff;
reg                     sec_clk_ff;
reg  [COUNT_SIZE-1:0]   count;
reg                     is_counting_nxt;

assign is_counting = is_counting_ff;
assign sec_clk = sec_clk_ff;

always @ (*)
begin
  if (rst) begin
    is_counting_nxt = 1'b0;
  end
  else if (start) begin     
    is_counting_nxt = 1'b1;
  end 
  else 
    is_counting_nxt = is_counting_ff;  
end
	
always @ (posedge clk)
  if (is_counting_ff && (count == 19'd500000)) begin
     count <= {SIZE{1'b0}};
	  is_counting_ff <= is_counting_nxt;
	  sec_clk_ff <= ~sec_clk_ff;
  end
  else begin
     count <= count + 1'b1;
     is_counting_ff <= is_counting_nxt;
	  sec_clk_ff <= sec_clk_ff;
  end
	 
endmodule
