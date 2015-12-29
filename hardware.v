module hardware
(
	input 	clock,
	input	notReset,
	input	RxD,
	output	valid,
	output reg	[6:0]segmentx0,
	output reg	[6:0]segmentx1,
	output reg	[6:0]segmentx2,
	output reg	[6:0]segmenty0,
	output reg	[6:0]segmenty1,
	output reg	[6:0]segmenty2
);

	wire reset = !notReset;
	
	wire	dataStart;
	wire	dataReady;
	wire	[7:0]dataIn;
	reg		sendComplete;
	
	wire	[9:0]x_out;
	wire	[8:0]y_out;
	
	wire	[3:0]	bcdx0,
					bcdx1,
					bcdx2;
	wire	[6:0]	segx0,
					segx1,
					segx2;
	
	wire	[3:0]	bcdy0,
					bcdy1,
					bcdy2;
	wire	[6:0]	segy0,
					segy1,
					segy2;

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
	
	/** Binary to BCD Converter **/
	bcd converter_x(	.number	(x_out),
						.bcd0	(bcdx0),
						.bcd1	(bcdx1),
						.bcd2	(bcdx2)
				   );
	bcd converter_y(	.number	({1'b0,y_out}),
						.bcd0	(bcdy0),
						.bcd1	(bcdy1),
						.bcd2	(bcdy2)
				   );
	
	/** Seven-segment converter **/
	bcdto7seg segx0conv(	.bcd	(bcdx0),
							.seg	(segx0));
	bcdto7seg segx1conv(	.bcd	(bcdx1),
							.seg	(segx1));
	bcdto7seg segx2conv(	.bcd	(bcdx2),
							.seg	(segx2));
	bcdto7seg segy0conv(	.bcd	(bcdy0),
							.seg	(segy0));
	bcdto7seg segy1conv(	.bcd	(bcdy1),
							.seg	(segy1));
	bcdto7seg segy2conv(	.bcd	(bcdy2),
							.seg	(segy2));
	
	/** Output register **/
	always @(posedge clock)
	begin
		if(reset)
		begin
			sendComplete <= 1'b0;
			
			segmentx0 <= 7'b1111111;
			segmentx1 <= 7'b1111111;
			segmentx2 <= 7'b1111111;
			
			segmenty0 <= 7'b1111111;
			segmenty1 <= 7'b1111111;
			segmenty2 <= 7'b1111111;
		end
		else if(valid)
		begin
			sendComplete <= 1'b1;
		
			segmentx0 <= segx0;
			segmentx1 <= segx1;
			segmentx2 <= segx2;
			
			segmenty0 <= segy0;
			segmenty1 <= segy1;
			segmenty2 <= segy2;
		end
	end
	
endmodule 