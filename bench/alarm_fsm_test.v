/* Test that the alarm handles reset and when 
   enabled will count to max and raise the alarm */
module alarm_fsm_test ();

  localparam SIZE = 4;

  reg rst, enable, sec_clk;
  reg [SIZE-1:0] max;
  wire [SIZE-1:0] count;
  wire alarm;

  vlog_tb_utils vlog_tb_utils0();

  initial 
  begin
    rst = 0;
    enable = 0;
    sec_clk = 0;
    max = 4'b0;
  end
      
  always 
    #5  sec_clk =  ! sec_clk; 
  
  initial
  begin
    #15 rst = 1;
    #5 rst = 0;
  
    #20 max = 4'b0101;
    #30 enable = 1;
  
    #60 enable = 0;
  
    #10 rst = 1;
    #10 rst = 0;
  
    #20  $finish;
  end
 
  alarm_fsm #(.SIZE(SIZE)) alarm_fsmi (.rst(rst),
					 .sec_clk(sec_clk),
					 .enable(enable),
					 .max(max),
					 .count(count),
					 .alarm(alarm));
					 
endmodule
