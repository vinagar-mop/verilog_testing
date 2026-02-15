`timescale 1ns/1ps // Time unit / Time precision

module tb_clock_gen;
    reg clk = 0;
    
    // Generate a 100 MHz clock (5ns high, 5ns low, 10ns period)
    initial begin
        forever #5 clk = !clk; 
    end

    // Example of using a one-off delay
    initial begin
        #100; // Wait 100ns
        $display("Time is %t: Timer expired", $time); //
        // Further actions...
        #100 $finish(); // Terminate simulation after another 100ns
    end
endmodule
