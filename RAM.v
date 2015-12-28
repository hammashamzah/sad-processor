module RAM
(
	input	clock,
	input	wrEn,
	input	[639:0]data_in,
	input	[8:0]readAddr,
	input	[8:0]writeAddr,
	output	[639:0]data_out
);

	reg	[8:0]addr;
	reg	[639:0]ram[0:479];
	reg	[639:0]temp;
	
	always @(posedge clock)
	begin
		addr <= wrEn? writeAddr : readAddr;
		temp <= data_in;
		
		if(wrEn)
			ram[addr] <= temp;
	end
	
	assign data_out = ram[addr];

endmodule 