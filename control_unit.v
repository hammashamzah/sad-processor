/** state **/
`define IDLE				3'd0
`define INPUT				3'd1
`define	FIRST_PROCESSING	3'd2
`define NEXT_PROCESSING		3'd3
`define FINISH_MATCH		3'd4
`define FINISH_NOTMATCH		3'd5

/** UARTsend **/
`define OFF			2'd0
`define	MATCH		2'd1
`define NOT_MATCH	2'd2

module control_unit
(
	input	clock,
	input	reset,
	input	UARTstart,
//	input	[8:0]FIFOreadyRows,
	input	FIFOready,
	input	PEmatch,
	input	UARTsendComplete,
	output reg	[8:0]RAMtoRead,
	output	[11:0]ROMtoRead,
	output reg	PEshift,
	output reg	[1:0]UARTsend
);

	reg	[2:0]state,nextState;
	reg	[8:0]currentRow;
	reg [6:0]rowTemplate;
	reg [5:0]colTemplate;
	wire	processFinished;

	/** Current and next state handling **/
	always @(posedge clock)
	begin
		if(reset)
			state <= `IDLE;
		else
			state <= nextState;
	end
	
	always @(state or UARTstart or FIFOready or processFinished or PEmatch or currentRow or UARTsendComplete)
	begin
		case(state)
			`IDLE:
				nextState <= UARTstart? `INPUT : state;
			`INPUT:
				nextState <= FIFOready? `FIRST_PROCESSING : state;
			`FIRST_PROCESSING:
				nextState <= processFinished? (PEmatch? `FINISH_MATCH : `NEXT_PROCESSING) : state;
			`NEXT_PROCESSING:
				nextState <= (currentRow >= 9'd379 && processFinished)? `FINISH_NOTMATCH : (processFinished && PEmatch)? `FINISH_MATCH : state;
			`FINISH_MATCH:
				nextState <= UARTsendComplete? `IDLE : state;
			`FINISH_NOTMATCH:
				nextState <= UARTsendComplete? `IDLE : state;
			default:
				nextState <= state;
		endcase
	end

	/**** OUTPUT HANDLING ****/
	/** processFinished **/
	assign processFinished = (ROMtoRead >= 12'd3999) || (!PEmatch);
	
	/** currentRow **/
	always @(posedge clock)
	begin
		case(state)
			`FIRST_PROCESSING:
				currentRow <= processFinished? 9'd1 : 9'd0;
			`NEXT_PROCESSING:
				currentRow <= processFinished? (currentRow + 9'd1) : currentRow;
			default:
				currentRow <= 9'd0;
		endcase
	end
	
	/** colTemplate and rowTemplate **/
	always @(posedge clock)
	begin
		if(state == `FIRST_PROCESSING || state == `NEXT_PROCESSING)
		begin
			colTemplate <= (processFinished || colTemplate >= 6'd39)? 6'd0 : (colTemplate + 6'd1);
			rowTemplate <= processFinished? 7'd0 : ((colTemplate >= 6'd39)? (rowTemplate + 7'd1) : rowTemplate);
		end
		else
		begin
			colTemplate <= 6'd0;
			rowTemplate <= 7'd0;
		end
	end
	
	/** ROMtoRead **/
	assign ROMtoRead = 12'd40 * {5'd0,rowTemplate} + {6'd0,colTemplate};
	
	/** RAMtoRead **/
	always @(posedge clock)
	begin
		if(state == `FIRST_PROCESSING || state == `NEXT_PROCESSING)
		begin
			RAMtoRead <= processFinished? (currentRow)
				: (colTemplate >= 6'd39)? (RAMtoRead + 9'd1) : RAMtoRead;
		end
		else
			RAMtoRead <= 9'd0;
	end
	
	/** PEshift **/
	always @(posedge clock)
	begin
		if(state == `FIRST_PROCESSING || state == `NEXT_PROCESSING)
		begin
			PEshift <= (colTemplate >= 6'd39)? 1'd1 : 1'd0;
		end
		else
			PEshift <= 1'd0;
	end
	
	/** UARTsend **/
	always @(posedge clock)
	begin
		case(state)
			`FINISH_MATCH:
				UARTsend <= `MATCH;
			`FINISH_NOTMATCH:
				UARTsend <= `NOT_MATCH;
			default:
				UARTsend <= `OFF;
		endcase
	end
	
endmodule 