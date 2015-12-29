module hardware
(
	input 	clock,
	input	notReset,
	input	RxD,
	output	valid,
	output	[9:0]x_out,
	output	[8:0]y_out
);

	wire reset = !notReset;
	
	wire	dataStart;
	wire	dataReady;
	wire	[7:0]dataIn;
	wire	sendComplete = 1'b1;

	async_receiver UART_Rx(	.clk			(clock),
							.rst			(reset),
							.RxD			(RxD),
							.RxD_start		(dataStart),
							.RxD_data_ready	(dataReady),
							.RxD_data		(dataIn)
						  );

	topLevel_withoutUART top_level(	.clock				(clock),
									.reset				(reset),
									.UARTstart			(dataStart),
									.UARTready			(dataReady),
									.UARTsendComplete	(sendComplete),
									.data_in			(dataIn),
									.valid_out			(valid),
									.x_out				(x_out),
									.y_out				(y_out)
								  );
						  
endmodule 