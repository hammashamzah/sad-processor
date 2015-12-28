module vertical_processor(
	input[639:0] original,
	input template,
	output sad_status,
	output[9:0] coordinate
);
	wire[599:0] sad_flag;
	wire[9:0] out_sad[639:0];
	pe processing_element_0(clk, rst, out_sad[0], template, original[0], control_change_row, out_sad[39], 1'b0);
	
	encoder encdr(
		.binary_out(coordinate),
		.encoder_in(sad_flag)
	);

	genvar i;
	generate
		for (i = 1; i < 600; i = i + 1)
		begin:pe_with_sad
			pe processing_element_i(clk,rst, out_sad[i], template, original[i], control_change_row, out_sad[i+39], out_sad[i-1]);
			
		end
	endgenerate

	genvar j;
	generate
		for (j = 600; j < 640; j = j + 1)
		begin:pe_without_sad
			pe processing_element_j(clk,rst, out_sad[j], template, original[j], control_change_row, out_sad[j-1], out_sad[j-1]);
			
		end
	endgenerate


	genvar k;
	generate
		for (k = 40; k < 639; k = k + 1)
		begin:out_assign
			assign sad_flag[k-40] = out_sad[k] == 500 ? 0 : 1; 	
		end
	endgenerate

	assign sad_status = |sad_flag;

endmodule

	