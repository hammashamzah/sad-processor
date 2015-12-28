`define row         640                 
`define column      480               
`define addrW       9

module RAM(clk, rst, data_in, data_out, wr_en,readAddr,RAM_full);
  input                 rst, clk, wr_en;   
  // reset, system clock, write enable and read enable.
  input [`row-1:0]      data_in;                   
  // data input to be pushed to buffer
  input [`addrW-1:0]    readAddr;
  output[`row-1:0]      data_out;                  
  output reg RAM_full;
     

  reg[`row-1:0]      data_out;
  reg                RAM_empty;
  reg[`addrW-1:0]    RAM_counter;
  reg[`addrW-1:0]    writeAddr;           
  // pointer to read and write addresses  
  reg[`row-1:0]       ram[0:`column-1];  

  always @(RAM_counter)  
  begin
    RAM_empty = (RAM_counter==0);
    RAM_full =  (RAM_counter== `column);
  end

  always @(posedge clk)
  begin
    if( rst )
      RAM_counter <= 0;
    else if( !RAM_full && wr_en )
      RAM_counter <= RAM_counter + 1;
  end

  always @( posedge clk) begin
    if( !RAM_empty )
      data_out <= ram[readAddr];
    else
      data_out <= data_out;
  end

  always @(posedge clk) begin
    if( wr_en && !RAM_full )
      ram[writeAddr] <= data_in;
    else
      ram[writeAddr] <= ram[writeAddr];
  end

  always@(posedge clk) begin
    if( rst ) begin
      writeAddr <= 0;
    end
    else begin
      if( !RAM_full && wr_en )    
        writeAddr <= writeAddr + 1;
      else  
        writeAddr <= writeAddr;
    end
  end

endmodule
