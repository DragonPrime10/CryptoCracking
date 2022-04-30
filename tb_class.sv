`timescale 1ns/1ps
module stimulus_class();

  logic 	Start;
  logic 	reset;
  logic [63:0] Key;
  logic [55:0] count;
  logic [63:0] plaintext, ciphertext;
  
  localparam [55:0] countThreshold = 2**23;
  logic 	   Found;   
  
  logic 	   clk;   
  
  integer 	   outputFilePointer;
  integer 	   testVectorFilePointer;
  
  logic [31:0] vectornum;   

  // Replace with your plaintext and ciphertext
  assign plaintext = 64'h1332106d519b0b5e;
  assign ciphertext = 64'he330709c4ec0431b;

  top dut (clk, Start, reset, plaintext, ciphertext, count, Key, Found);

  initial 
    begin	
	  clk = 1'b0;
	  forever #5 clk = ~clk;
    end

  initial
    begin
	  vectornum = 0;
	  outputFilePointer = $fopen("count.out");
	end
	  

  always @(posedge clk) 
    begin
	  if (Found == 1'b1) begin
		$fdisplay(outputFilePointer, "%h %b | %h", Key, Found, count);
		$display("Found key!");
		$stop();
      end
	end

  initial
    begin
	  // Initialize
	  #0   Start = 1'b0;	
	  #0   reset = 1'b1;
	  #101 reset = 1'b0;
	  #32  Start = 1'b1;
	  //#20  Start = 1'b0;
	  
    end 

endmodule // tb
