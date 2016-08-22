/* Test the LED driver properly MUX's between Second Clock and Count */
module led_driver_test ();

localparam SIZE = 4;

reg clk, alarm, rst;
reg [SIZE-1:0] count;

wire [SIZE-1:0] led;

vlog_tb_utils vlog_tb_utils0();

initial 
begin
  rst = 0;
  alarm = 0;
  clk = 0;
  count = {SIZE{1'b0}};
end
      
always
begin
  #5  clk =  ! clk; 
  #10 count = count + 1;
end
  
led_driver #(.SIZE(SIZE)) led_driveri (.rst(rst),
                .clk(clk),
					 .alarm(alarm),
					 .count(count),
					 .led(led));

initial
begin
  #2 rst = 1;
  #2 rst = 0;
  #150 alarm = 1;
  #2 alarm = 0;
  
  #200  $finish;
end
					 
endmodule
