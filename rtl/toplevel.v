module toplevel
	(input           sys_clk_pad_i, 
	 input           rst_n_pad_i, 
	 input           btn_n_pad_i, 
	 input   [3:0]   gpio1_i,      /* dip switches */
	 output  [7:0]   gpio0_io);    /* leds */

wire c0;
wire rst;
wire start;

assign rst = ~rst_n_pad_i;
assign start = ~btn_n_pad_i;

assign gpio0_io[7:4] = 4'b0000;

pll plli (.inclk0(sys_clk_pad_i), .c0(c0));

egg_timer #(.SIZE(4)) egg_timeri (.clk(c0),
                                  .rst(rst),
                                  .start(start),
				  .max(gpio1_i),
				  .led(gpio0_io[3:0]));

endmodule
