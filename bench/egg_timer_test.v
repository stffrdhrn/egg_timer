/* Test the whole err timer works */
module egg_timer_test ();

localparam SIZE = 4;

reg rst, start, clk;
reg [SIZE-1:0] max;

wire [SIZE-1:0] led;

initial 
begin
  max = 4'b0111;
  rst = 0;
  start = 0;
  clk = 0;
end
      
always 
  #1  clk =  ! clk; 
  
egg_timer #(.SIZE(SIZE)) egg_timeri (.clk(clk),
					 .rst(rst),
					 .start(start),
					 .max(max),
					 .led(led));

initial
begin
  #15 rst = 1;
  #5 rst = 0;

  #15 start = 1;
  #5 start = 0;  

  #500 $display("Enable = %b, Alarm = %b, Count, %b", egg_timeri.enable, egg_timeri.alarm, egg_timeri.count);
  #500 $display("Enable = %b, Alarm = %b, Count, %b", egg_timeri.enable, egg_timeri.alarm, egg_timeri.count);
  #500 $display("Enable = %b, Alarm = %b, Count, %b", egg_timeri.enable, egg_timeri.alarm, egg_timeri.count);
  #500 $display("Enable = %b, Alarm = %b, Count, %b", egg_timeri.enable, egg_timeri.alarm, egg_timeri.count);
  #500 $display("Enable = %b, Alarm = %b, Count, %b", egg_timeri.enable, egg_timeri.alarm, egg_timeri.count);
  #500 $display("Enable = %b, Alarm = %b, Count, %b", egg_timeri.enable, egg_timeri.alarm, egg_timeri.count);
  
  #5000 $display("Enable = %b, Alarm = %b, Count, %b", egg_timeri.enable, egg_timeri.alarm, egg_timeri.count);
  
  
  #2000  $finish;
end
					 
endmodule
