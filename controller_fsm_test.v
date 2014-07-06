/* Test the the controller can handle reset 
   and that it generates the proper second timing signal */
module controller_fsm_test ();

localparam SIZE = 4;

reg rst, start, clk;

wire is_counting, sec_clk;

initial 
begin
  rst = 0;
  start = 0;
  clk = 0;
end
      
always 
  #1  clk =  ! clk; 
  
controller_fsm #(.SIZE(SIZE)) controller_fsmi (.rst(rst),
					 .start(start),
					 .clk(clk),
					 .is_counting(is_counting),
					 .sec_clk(sec_clk));

initial
begin
  #15 rst = 1;
  #5 rst = 0;
  
  #10 start = 1;
  #10 start = 0;
  
  #100 $display("%b", controller_fsmi.count);
  #100 $display("%b", controller_fsmi.count);
  
  #1000 $display("%b", controller_fsmi.count);
  
  #5000 rst = 1;
  #5 rst = 0;
  
  #20  $finish;
end
					 
endmodule
