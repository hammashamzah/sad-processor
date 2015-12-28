`define width 8
`define buf_size 80
`define addrW       9

module serialGPIO(
    input clk,
    input rst,
    input RxD,
    output reg [`width-1:0] GPout,  // general purpose outputs   
    output reg RAM_full
);

wire RxD_data_ready;
wire [`width-1:0] RxD_data;
wire buff_full;
wire [`buf_size*`width-1:0] buf_out;
wire [`buf_size*`width-1:0] data_out;
wire [`addrW-1:0]    readAddr;

async_receiver RX(.clk(clk), .RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));
BufferSerial Buffer(.clk(clk),.rst(rst),.wr_en(RxD_data_ready),.buf_full(buf_full),.buf_in(RxD_data),.buf_out(buf_out)); 
RAM RAM(.clk(clk), .rst(rst), .data_in(buf_out), .data_out(data_out), .wr_en(buf_full),.readAddr(addr),.RAM_full(RAM_full));

endmodule

