	microarquiteturaQsys u0 (
		.buttons_export      (<connected-to-buttons_export>),      // buttons.export
		.clk_clk             (<connected-to-clk_clk>),             //     clk.clk
		.lcd_read_write      (<connected-to-lcd_read_write>),      //     lcd.read_write
		.lcd_register_select (<connected-to-lcd_register_select>), //        .register_select
		.lcd_data_out        (<connected-to-lcd_data_out>),        //        .data_out
		.lcd_enable_op       (<connected-to-lcd_enable_op>),       //        .enable_op
		.leds_export         (<connected-to-leds_export>),         //    leds.export
		.reset_reset_n       (<connected-to-reset_reset_n>)        //   reset.reset_n
	);

