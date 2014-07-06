module egg_timer
  #(parameter            SIZE = 4)
	(input                clk, 
	 input                rst, 
	 input                start, 
	 input   [SIZE-1:0]   max, 
	 output  [SIZE-1:0]   led);

/* clk   - epected to be a 1Khz signal */
/* rst   - stop the alarm and reset internal counter and counting state to 0 */
/* start - will enable counting  */

wire enable;
wire controller_rst;
wire alarm;
wire [SIZE-1:0] count;
wire sec_clk;

assign controller_rst = rst || alarm;

controller_fsm #(.SIZE(SIZE)) controller_fsmi (.rst(controller_rst),
					 .start(start),
					 .clk(clk),
					 .is_counting(enable),
					 .sec_clk(sec_clk));

alarm_fsm #(.SIZE(SIZE)) alarm_fsmi (.rst(controller_rst),
					 .sec_clk(sec_clk),
					 .enable(enable),
					 .max(max),
					 .count(count),
					 .alarm(alarm));
					 
led_driver  #(.SIZE(SIZE)) led_driveri (.rst(rst),
                  .clk(sec_clk),
                  .alarm(alarm), 
						.count(count),
						.led(led));

endmodule
