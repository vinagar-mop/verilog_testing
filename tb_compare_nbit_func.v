`timescale 1us/1ns
module tb_compare_nbit_func();
   
    // Testbench variables
    parameter CMP_WIDTH = 5;
	reg [CMP_WIDTH-1:0] a, b;
	wire greater, equal, smaller;
	
    // Instantiate the DUT
    compare_nbit_func
      #(.CMP_WIDTH(CMP_WIDTH))
	  CMP0
      (.a      (a      ),
       .b      (b      ),
	   .greater(greater),
	   .equal  (equal  ),
	   .smaller(smaller));
	
	initial begin
	       $monitor ($time, " a = %d, b = %d, greater = %b, equal = %b, smaller = %b", 
		                    a, b, greater, equal, smaller);
	    #1 a = 3; b = 2;
		#1 b = 3;
		#1 a = 9; b = 11;
	end
  
endmodule
