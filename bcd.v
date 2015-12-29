module bcd
(
	input	[9:0]number,
	output	[3:0]bcd0,
	output	[3:0]bcd1,
	output	[3:0]bcd2
);

	reg	[9:0]	temp0,
				temp1,
				temp2;

	always @(number)
	begin
		if(number >= 10'd640)
		begin
			temp0 <= 10'b1111;
			temp1 <= 10'b1111;
			temp2 <= 10'b1111;
		end
		else
		begin
			temp0 <=  number % 10'd10;
			temp1 <= (number % 10'd100) / 10'd10;
			temp2 <= (number / 10'd100);
		end
	end

	assign bcd0 = temp0[3:0];
	assign bcd1 = temp1[3:0];
	assign bcd2 = temp2[3:0];
	
endmodule 