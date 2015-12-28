`define width 8
`define buf_size 80
`define buf_width 7

module BufferSerial(
  clk,
  rst,
  wr_en,
  buf_empty,
  buf_full,
  rd_en,
  buf_in,
  buf_out 
);

input clk,rst;
input wr_en, rd_en;
input   [`width-1:0] buf_in;  
output  [`buf_size*`width-1:0] buf_out;
output reg  buf_empty, buf_full;


reg[`buf_width-1:0]    fifo_counter;
reg[`buf_width-1:0]    wr_ptr;   
  
reg[`width-1:0]  buf_mem[`buf_size-1 : 0];

always @(fifo_counter)  begin
  buf_empty = (fifo_counter==0);
  buf_full =  (fifo_counter== `buf_size);
end

always @(posedge clk) begin
  if(rst)
    fifo_counter <= 0;
  else if( (!buf_full && wr_en) && ( !buf_empty && rd_en ) )
    fifo_counter <= fifo_counter;
  else if( !buf_full && wr_en )
    fifo_counter <= fifo_counter + 1;
  else if( !buf_empty && rd_en )
    fifo_counter <= fifo_counter - 1;
  else
    fifo_counter <= fifo_counter;
end

always @(posedge clk) begin
  if( wr_en && !buf_full )
    buf_mem[wr_ptr] <= buf_in;
  else
    buf_mem[wr_ptr] <= buf_mem[wr_ptr];
end

always@(posedge clk or posedge rst) begin
  if( rst )
    wr_ptr <= 0;
  else begin
    if( !buf_full && wr_en )    
      wr_ptr <= wr_ptr + 1;
    else  
      wr_ptr <= wr_ptr;
  end
end


genvar pk_idx; 
generate for (pk_idx=0; pk_idx<(`buf_size); pk_idx=pk_idx+1) begin; 
  assign buf_out[((`width)*pk_idx+((`width)-1)):((`width)*pk_idx)] = (rd_en && buf_full) ?  buf_mem[pk_idx][((`width)-1):0] : 0; 
end; 
endgenerate

endmodule