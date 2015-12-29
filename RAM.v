`define row         640                 
`define column      480               
`define addrW       9

module RAM(clk, rst, data_in, data_out, wr_en_in,readAddr,RAM_full);

	input				rst, clk, wr_en_in;   
	input	[`row-1:0]  data_in;                   
	input	[`addrW-1:0]readAddr;
	output	[`row-1:0]  data_out;                  
	output	RAM_full;
     

	wire	[`row-1:0]data_out;
	reg		[`addrW-1:0]writeAddr;
	reg		[`addrW-1:0]addr;
	reg		[`row-1:0]  temp;
	reg		wr_en;
	
	reg		[`row-1:0]ram[0:`column-1];  
	
	assign RAM_full = (writeAddr == `column);

	/** Write Enable **/
	always @(posedge clk)
		wr_en <= wr_en_in;
	
	/** RAM **/
	always @(posedge clk)
	begin
		addr <= wr_en_in? writeAddr : readAddr;
		temp <= data_in;
		
		if(wr_en)
			ram[addr] <= temp;
	end
	assign data_out = (wr_en)? data_in : ram[addr];
  
	/** writeAddr counter **/
	always@(posedge clk) begin
		if( rst )
			writeAddr <= 0;
		else if( !RAM_full && wr_en )    
			writeAddr <= writeAddr + `addrW'd1;
	end

endmodule
