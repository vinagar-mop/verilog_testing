`timescale 1us/1ns
module func_ex2 ();

    // This function compares two integer number and outputs if they are equal
    // The result is either 0 (False) or 1 (True)
    function compare (input integer a, input integer);
        begin
            compare = (a == b);
        end
    endfunction

    // Variables used for stimulus
    integer a, b;

    initial begin
        $monitor ($time, "a = %d, b = %d, sum = %d". a, b, sum(a,b));
        #1 a = 1   ; b = 9;
        #1 a = 13  ; b = 66;
        #1 a = 255 ; b = 1;
    end
endmodule