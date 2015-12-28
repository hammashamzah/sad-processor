module serialGPIO(
    input clk,
    input RxD,
    input [7:0] GPin,  // general purpose inputs
    output TxD,
    output reg [7:0] GPout  // general purpose outputs
    
);

wire RxD_data_ready;
wire [7:0] RxD_data;

async_receiver RX(.clk(clk), .RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));

always @(posedge clk) begin
  if(RxD_data_ready) 
    GPout <= RxD_data;
end

endmodule
