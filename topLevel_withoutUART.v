/** UARTsend **/
`define OFF			2'd0
`define	MATCH		2'd1
`define NOT_MATCH	2'd2

module topLevel_withoutUART
(
	input	clock,
	input 	reset,
	input 	UARTstart,
	input	UARTsendComplete,
	input 	[7:0]data_in,
	output	valid,
	output reg	[9:0]x_out,
	output reg	[8:0]y_out
);

	wire		ready,
				writeEnable;
	wire [8:0]	RAMtoRead,
				RAMtoWrite;
	wire [11:0]	ROMtoRead;
	wire [639:0]rowData,
				rowInput;
	wire 		templateData;
	
	wire		match,
				PEreset,
				PEshift;
	
	wire [1:0]	UARTsend;
	
	wire [9:0]x;
	wire [8:0]y;

	/** Control Unit **/
	control_unit controlUnit(	.clock				(clock),
								.reset				(reset),
								.UARTstart			(UARTstart),
								.FIFOready			(ready),
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
	
	
	/** Image RAM **/
	RAM RAM0(	.clock		(clock),
				.wrEn		(writeEnable),
				.data_in	(rowInput),
				.readAddr	(RAMtoRead),
				.writeAddr	(RAMtoWrite),
				.data_out	(rowData)
			);
			
	/** Template ROM **/
	template_image_rom ROM(	.addr	(ROMtoRead),
							.clk	(clock),
							.out	(templateData)
						  );
	
	/** Processing Element **/
	vertical_processor PE0(	.clk				(clock),
							.rst				(reset),
							.control_change_row	(PEshift),
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
		end
		else if(valid)
		begin
			x_out <= x;
			y_out <= y;
		end
	end
	
endmodule 