module topLevel_withoutIO_tb
(
	output	valid,
	output	[9:0]x_out,
	output	[8:0]y_out
);

	reg	clk,
		rst,
		start,
		ready,
		sendComplete;
	wire	[8:0]RAMtoRead;
	wire	[11:0]ROMtoRead;
	wire	PEreset;
	wire	PEshift;
	wire	PEmatch;
	wire	[1:0]UARTsend;
	
	topLevel_withoutIO toplevel(	.clock				(clk),
									.reset				(rst),
									.UARTstart			(start),
									.RAMready			(ready),
									.UARTsendComplete	(sendComplete),
									.valid				(valid),
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
		start = 1'b0;
		ready = 1'b0;
		sendComplete = 1'b0;
		
		#12
		rst = 1'b0;
		#5
		start = 1'b1;
		#10
		start = 1'b0;
		
		#50
		ready = 1'b1;
		#10
		ready = 1'b0;
	end
	
endmodule 