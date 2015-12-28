module control_unit_tb();

	reg	clk,
		rst,
		start,
		ready,
		match,
		sendComplete;
	wire	[8:0]RAMtoRead;
	wire	[11:0]ROMtoRead;
	wire	PEreset;
	wire	PEshift;
	wire	[1:0]UARTsend;
	
	control_unit controlUnit(	.clock				(clk),
								.reset				(rst),
								.UARTstart			(start),
								.FIFOready			(ready),
								.PEmatch			(match),
								.UARTsendComplete	(sendComplete),
								.RAMtoRead			(RAMtoRead),
								.ROMtoRead			(ROMtoRead),
								.PEreset			(PEreset),
								.PEshift			(PEshift),
								.UARTsend			(UARTsend)
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
		match = 1'b1;
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
		
		#(3995*10)
		match = 1'b0;
		#10
		match = 1'b1;
		
		#(3995*10)
		match = 1'b0;
		#10
		match = 1'b1;
		
		#(3995*10)
		match = 1'b0;
		#10
		match = 1'b1;
		
		#(3995*10)
		match = 1'b0;
		#10
		match = 1'b1;
		
		#(4000*10)
		#100
		sendComplete = 1'b1;
		#10
		sendComplete = 1'b0;
	end
	
endmodule 