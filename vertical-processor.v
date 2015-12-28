module vertical_processor(
	input[639:0] I,
	input T,
	output[9:0] sad[639:0]
);

	wire[9:0] out_sad[639:0];
	pe processing_element_0(clk, rst, out_sad[0], T, I[0], control_change_row, out_sad[39], 0)
	
	genvar i;
	generate
		for (i = 1; i < 600; i = i + 1)
		begin:pe
			pe processing_element_i(clk,rst, out_sad[i], T, I[i], control_change_row, out_sad[i+39], out_sad[i-1]);
			
		end
	endgenerate

	genvar i;
	generate
		for (i = 600; i < 640; i = i + 1)
		begin:pe
			pe processing_element_i(clk,rst, out_sad[i], T, I[i], control_change_row, out_sad[i-1], out_sad[i-1]);
			
		end
	endgenerate


	assign sad = out_sad;
endmodule

	