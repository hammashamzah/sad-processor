`define START     4'b0000
`define BIT0      4'b1000
`define BIT1      4'b1001
`define BIT2      4'b1010
`define BIT3      4'b1011
`define BIT4      4'b1100
`define BIT5      4'b1101
`define BIT6      4'b1110
`define BIT7      4'b1111
`define STOP      4'b0010
 
module async_receiver(
	input clk,
	input RxD,
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
     `START: if(~RxD) begin
        RxD_state <= `BIT0;  // start bit found
        SamplingStart <= 1'b1;
     end
	   `BIT0: if(next_bit) RxD_state <= `BIT1;  // bit 0
	   `BIT1: if(next_bit) RxD_state <= `BIT2;  // bit 1
	   `BIT2: if(next_bit) RxD_state <= `BIT3;  // bit 2
	   `BIT3: if(next_bit) RxD_state <= `BIT4;  // bit 3
	   `BIT4: if(next_bit) RxD_state <= `BIT5;  // bit 4
	   `BIT5: if(next_bit) RxD_state <= `BIT6;  // bit 5
	   `BIT6: if(next_bit) RxD_state <= `BIT7;  // bit 6
	   `BIT7: if(next_bit) RxD_state <= `STOP;  // bit 7
	   `STOP: if(next_bit) begin
	     RxD_state <= `START;  // stop bit
	     SamplingStart <= 1'b0;
	   end
	   default: RxD_state <= `START;
    endcase
  end
end

always @(posedge clk) begin
  if(next_bit && RxD_state[3]) 
    RxD_data <= {RxD, RxD_data[7:1]};
end

//RxD_data_ready if bit 7 has received
always @(posedge clk) begin
	RxD_data_ready <= (next_bit && RxD_state==`STOP && RxD);  // make sure a stop bit is received
end

endmodule
