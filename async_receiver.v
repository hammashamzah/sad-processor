module async_receiver(
	input clk,
	input RxD,
	//input OversamplingTick,
	output reg RxD_data_ready = 0,
	output reg [7:0] RxD_data = 0  // data received, valid only (for one clock cycle) when RxD_data_ready is asserted
);

parameter ClkFrequency = 50000000; // 50MHz
parameter Baud = 115200;

wire OversamplingTick;
BaudTickGen #(ClkFrequency, Baud) tickgen(.clk(clk), .enable(1'b1), .BaudTick(OversamplingTick));

function integer log2(input integer v); 
begin 
  for (log2=0;v>0;log2=log2+1) 
    v = v>>1;
  log2=log2-1; 
end endfunction

//localparam OversamplingCntWidth = log2(Oversampling);
reg [3:0] RxD_state = 0;

reg SamplingStart;
wire next_bit = OversamplingTick && SamplingStart;

// now we can accumulate the RxD bits in a shift-register
always @(posedge clk) begin
  if(OversamplingTick) begin
    case(RxD_state)
     4'b0000: if(~RxD) begin
        RxD_state <= 4'b1000;  // start bit found
        SamplingStart <= 1'b1;
     end
	   4'b1000: if(next_bit) RxD_state <= 4'b1001;  // bit 0
	   4'b1001: if(next_bit) RxD_state <= 4'b1010;  // bit 1
	   4'b1010: if(next_bit) RxD_state <= 4'b1011;  // bit 2
	   4'b1011: if(next_bit) RxD_state <= 4'b1100;  // bit 3
	   4'b1100: if(next_bit) RxD_state <= 4'b1101;  // bit 4
	   4'b1101: if(next_bit) RxD_state <= 4'b1110;  // bit 5
	   4'b1110: if(next_bit) RxD_state <= 4'b1111;  // bit 6
	   4'b1111: if(next_bit) RxD_state <= 4'b0010;  // bit 7
	   4'b0010: if(next_bit) begin
	     RxD_state <= 4'b0000;  // stop bit
	     SamplingStart <= 1'b0;
	   end
	   default: RxD_state <= 4'b0000;
    endcase
  end
end

always @(posedge clk) begin
  if(next_bit && RxD_state[3]) 
    RxD_data <= {RxD, RxD_data[7:1]};
end

//RxD_data_ready if bit 7 has received
always @(posedge clk) begin
	RxD_data_ready <= (next_bit && RxD_state==4'b0010 && RxD);  // make sure a stop bit is received
end

endmodule
