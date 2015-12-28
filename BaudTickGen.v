module BaudTickGen(
	input clk, enable,
	output BaudTick  // generate a tick at the specified baud rate * oversampling
);
parameter ClkFrequency = 50000000;
parameter Baud = 115200;

function integer log2(input integer v); 
begin 
  for (log2=0;v>0;log2=log2+1) 
    v = v>>1;
end endfunction

//error over a byte
localparam BaudGeneratorAccWidth = log2(ClkFrequency/Baud)+8;  
reg [BaudGeneratorAccWidth:0] BaudGeneratorAcc = 0;

localparam BaudGeneratorInc = ((Baud << (BaudGeneratorAccWidth-4))+(ClkFrequency>>5))/(ClkFrequency>>4);

always @(posedge clk) begin 
  if(enable) 
    BaudGeneratorAcc <= BaudGeneratorAcc[BaudGeneratorAccWidth-1:0] + BaudGeneratorInc[BaudGeneratorAccWidth:0]; 
  else 
    BaudGeneratorAcc <= BaudGeneratorInc[BaudGeneratorAccWidth:0];
end

assign BaudTick = BaudGeneratorAcc[BaudGeneratorAccWidth];
endmodule