module led_driver 
 #(parameter             SIZE = 4)
 
  (input                 rst,
   input                 clk,
   input                 alarm,
   input    [SIZE-1:0]   count,
	output   [SIZE-1:0]   led);

reg alarm_ff;
reg [SIZE-1:0]   led_ff;
	
assign led = led_ff;

always @ (*)
begin
  if (rst) begin
    alarm_ff <= 1'b0;
	 led_ff <= {SIZE{1'b0}};
  end
  else if (alarm_ff) begin
    alarm_ff <= 1'b1;
    led_ff <= {SIZE{clk}};
  end
  else if (alarm) begin
    led_ff <= count;
	 alarm_ff <= 1'b1;
  end
  else begin
    alarm_ff <= 1'b0;
    led_ff <= count;
  end
end
 
endmodule