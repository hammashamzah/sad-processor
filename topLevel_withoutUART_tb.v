module topLevel_withoutUART_tb();

	reg clk;
	reg rst;
	reg UARTstart;
	reg UARTready;
	reg UARTsendComplete;
	reg[7:0] data_in;
	
	wire valid;
	wire[9:0] x_out;
	wire[8:0] y_out;
	
	integer in,
			StatusIn,
			i,
			temp;

	topLevel_withoutUART toplevel
	(
		.clock				(clk),
		.reset				(rst),
		.UARTstart			(UARTstart),
		.UARTready			(UARTready),
		.UARTsendComplete	(UARTsendComplete),
		.data_in			(data_in),
		.valid_out			(valid),
		.x_out				(x_out),
		.y_out				(y_out)
	);

	/** Clock generation **/
	always
		#5 clk = ~clk;
	
	/** Send inputs and receive outputs **/
	initial
	begin
		clk   = 1'b1;
		rst   = 1'b1;
		UARTsendComplete = 1'b0;
		UARTstart = 1'b0;
		UARTready = 1'b0;
		#20
		rst = 1'b0;
		#10
		UARTstart = 1'b1;
		#10
		UARTstart = 1'b0;
		
		in = $fopen("image_binary.txt","r");
		
		//#10
		repeat(640/8*480) //@(posedge clk)
		begin
			#10
			UARTready = 1'b1;
			
			for(i = 0; i < 8; i=i+1)
			begin
				StatusIn = $fscanf(in,"%d",data_in[i]);
			end
			#10
			
			UARTready = 1'b0;
			//#10
		end

		$fclose(in);
	end
	
endmodule 