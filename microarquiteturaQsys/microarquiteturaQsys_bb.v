
module microarquiteturaQsys (
	clk_clk,
	lcd_read_write,
	lcd_register_select,
	lcd_data_out,
	lcd_enable_op,
	leds_export,
	reset_reset_n,
	switches_export);	

	input		clk_clk;
	output		lcd_read_write;
	output		lcd_register_select;
	output	[7:0]	lcd_data_out;
	output		lcd_enable_op;
	output	[7:0]	leds_export;
	input		reset_reset_n;
	input	[7:0]	switches_export;
endmodule
