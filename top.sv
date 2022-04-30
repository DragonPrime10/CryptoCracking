module top (input logic clk, Start, reset, input logic [63:0] plaintext, ciphertext, output logic [55:0] count, output logic [63:0] Key, output logic FoundKeyNum);

  logic up;
  logic en1;
  logic en2;
  logic [63:0] info1;
  logic [63:0] info2;
  logic [63:0] info3;

  control ctrl (~clk, reset, Start, FoundKeyNum, up, en1, en2);
  
  UDL_Count #(56) counter (clk, reset, up, 1'b0, 1'b0, 56'h0, count);
  
  genParity8 parity (count, Key);
  
  DES des (Key, plaintext, 1'b1, info1); 
  
  flopenr #(64) cipherRegister (clk, reset, en1, info1, info2);
  
  flopenr #(64) keyRegister (clk, reset, en2, Key, info3); 
  
  comparator #(64) comp (ciphertext, info2, FoundKeyNum);

endmodule

module genParity8(input logic [55:0] in, output logic [63:0] out);
  genvar 						index;
  for(index = 0; index < 8; index++) begin
	genParity genParity(.in(in[7*index +: 7]), .out(out[8*index +: 8]));
  end
endmodule

module genParity(input logic [6:0] in, output logic [7:0] out);
  assign out[0] = ~^in;
  assign out[7:1] = in;
endmodule
