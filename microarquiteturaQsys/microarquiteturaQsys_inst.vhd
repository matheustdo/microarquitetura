	component microarquiteturaQsys is
		port (
			clk_clk             : in  std_logic                    := 'X';             -- clk
			lcd_read_write      : out std_logic;                                       -- read_write
			lcd_register_select : out std_logic;                                       -- register_select
			lcd_data_out        : out std_logic_vector(7 downto 0);                    -- data_out
			lcd_enable_op       : out std_logic;                                       -- enable_op
			leds_export         : out std_logic_vector(7 downto 0);                    -- export
			reset_reset_n       : in  std_logic                    := 'X';             -- reset_n
			switches_export     : in  std_logic_vector(7 downto 0) := (others => 'X')  -- export
		);
	end component microarquiteturaQsys;

	u0 : component microarquiteturaQsys
		port map (
			clk_clk             => CONNECTED_TO_clk_clk,             --      clk.clk
			lcd_read_write      => CONNECTED_TO_lcd_read_write,      --      lcd.read_write
			lcd_register_select => CONNECTED_TO_lcd_register_select, --         .register_select
			lcd_data_out        => CONNECTED_TO_lcd_data_out,        --         .data_out
			lcd_enable_op       => CONNECTED_TO_lcd_enable_op,       --         .enable_op
			leds_export         => CONNECTED_TO_leds_export,         --     leds.export
			reset_reset_n       => CONNECTED_TO_reset_reset_n,       --    reset.reset_n
			switches_export     => CONNECTED_TO_switches_export      -- switches.export
		);

