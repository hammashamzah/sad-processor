
module pe
#(parameter THRESHOLD = 10'd500)
(
	clk,
	rst,	
	out_s,
	in_t,
	in_i,
	select_s,
	in_s_1,
	in_s_2
);

	output[9:0] out_s;


	input clk;
	input rst;
	input in_t;
	input in_i;
	input select_s;
	input [9:0] in_s_1;
	input [9:0] in_s_2;

	wire in_adder_1;
	wire [9:0] in_adder_2;
	wire [9:0] out_adder;
	wire out_comp;
	wire [9:0] in_reg;
	wire [9:0] in_register;

	reg [9:0] register_value;

	always @(posedge clk) begin
		if (rst) begin
			register_value <= 10'd0;
		end
		else begin
			register_value <= in_register;
		end
	end

	assign in_adder_1 = in_t ^ in_i;

	assign in_adder_2 = select_s ? in_s_1 : in_s_2;

	assign out_adder = in_adder_1 + in_adder_2;

	assign out_comp = out_adder < THRESHOLD;

	assign in_register = out_comp ? out_adder : THRESHOLD ;

	assign out_s = register_value;

endmodule 
