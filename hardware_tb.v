module hardware_tb();

	reg clk;
	reg rst;
	reg RxD;
	
	wire valid;
	wire[9:0] x_out;
	wire[8:0] y_out;
	
	integer in,
			StatusIn,
			i,
			temp;

	hardware toplevel
	(
		.clock		(clk),
		.notReset	(rst),
		.RxD		(RxD),
		.valid		(valid),
		.x_out		(x_out),
		.y_out		(y_out)
	);

	/** Clock generation **/
	always
		#5 clk = ~clk;
	
	/** Send inputs and receive outputs **/
	initial
	begin
		clk = 1'b1;
		rst = 1'b0;
		RxD	= 1'b1;
		#20
		rst = 1'b1;
		
		#50
		in = $fopen("image_binary.txt","r");
		
		repeat(640/8*480)
		begin
			#10
			RxD = 1'b0;
			
			for(i = 0; i < 8; i=i+1)
			begin
				#10
				StatusIn = $fscanf(in,"%d",RxD);
			end
			
			#10
			RxD = 1'b1;
		end

		$fclose(in);
	end
	
endmodule 