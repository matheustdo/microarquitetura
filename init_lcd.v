
module init_lcd (dataA, dataB, result,clk, clk_en, reset, start, done, read_write, register_select, enable_op, data_out);

	input clk, clk_en, reset, start;
	input [31:0] dataA, dataB;
 
	output read_write;
	output [7:0] data_out;
	
	output reg [31:0] result;
	output reg register_select, enable_op, done;
	
	reg state;
	reg [31:0] counter;
	
	parameter idle_state = 1'b0, busy_state = 1'b1;  
	assign read_write = 1'b0;
	
	always @ (posedge clk) begin
	
		if (reset) begin
		
			counter <= 32'b0;
			state <= idle_state;
			result <= 1;
			done <= 0;
		
		end
		
		
		if (clk_en) begin
			
			case (state) 
				
				idle_state: begin
					
					done <= 1'b0;
					
					register_select <= dataA [0];
					data_out <= dataB [7:0];
				
					counter <= 32'd0;
					state <= busy_state;
				
				end 
				
				busy_state: begin
					
					if (counter < 100000) begin
						
						counter <= counter + 32'd1;
						
					end
					
					else begin
						
						result <= 32'd0;
						done <= 1'b1;
						state <= idle_state;
						
					end 
				
				end
			
			endcase
			
		end
		
	end
	

	
	

endmodule