/** UARTsend **/
`define OFF			2'd0
`define	MATCH		2'd1
`define NOT_MATCH	2'd2

module topLevel_withoutUART
(
	input	clock,
	input 	reset,
	input 	UARTstart,
	input	UARTready,
	input	UARTsendComplete,
	input	[7:0]data_in,
	output reg	valid_out,
	output reg	[9:0]x_out,
	output reg	[8:0]y_out
);

	wire	bufFull;
	wire	[639:0]inputData;
	wire	RAMready;

	wire [8:0]	RAMtoRead;
	wire [11:0]	ROMtoRead;
	wire [639:0]rowData;
	wire 		templateData;
	
	wire		match,
				PEreset,
				PEshift;
	
	wire [1:0]	UARTsend;
	
	wire valid;
	wire [9:0]x;
	wire [8:0]y;

	/** Control Unit **/
	control_unit controlUnit(	.clock				(clock),
								.reset				(reset),
								.UARTstart			(UARTstart),
								.FIFOready			(RAMready),
								.PEmatch			(match),
								.UARTsendComplete	(UARTsendComplete),
								.currentRow			(y),
								.RAMtoRead			(RAMtoRead),
								.ROMtoRead			(ROMtoRead),
								.PEreset			(PEreset),
								.PEshift			(PEshift),
								.UARTsend			(UARTsend)
							);
	
	/** Input Buffer **/
	BufferSerial buffer0(	.clk		(clock),
							.rst		(reset || bufFull),
							.wr_en		(UARTready),
							.buf_full	(bufFull),
							.buf_in		(data_in),
							.buf_out 	(inputData)
						);
						
	/** Input RAM **/
	RAM RAM0(	.clk		(clock),
				.rst		(reset),
				.data_in	(inputData),
				.data_out	(rowData),
				.wr_en_in	(bufFull),
				.readAddr	(RAMtoRead),
				.RAM_full	(RAMready)
			);
			
	/** Template ROM **/
	template_image_rom ROM(	.addr	(ROMtoRead),
							.clk	(clock),
							.out	(templateData)
						  );
	
	/** Processing Element **/
	vertical_processor PE0(	.clk				(clock),
							.rst				(PEreset),
							.change_row			(PEshift),
							.original			(rowData),
							.template			(templateData),
							.sad_status			(match),
							.coordinate			(x)
						  );
	
	/** Output handling **/
	assign valid = (UARTsend == `MATCH);
	always @(posedge clock)
	begin
		if(reset)
		begin
			x_out <= 10'b1111111111;
			y_out <=  9'b111111111;
			valid_out <= 1'b0;
		end
		else if(valid)
		begin
			x_out <= x;
			y_out <= y;
			valid_out <= 1'b1;
		end
	end

endmodule 