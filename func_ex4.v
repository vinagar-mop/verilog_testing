module func_ex();

    // Recursive function example
    function automatic integer fibonacci (input integer N);
        // Internal variable for intermedary results
        // Have to be declared before "begin/end"
        integer result = 0;
        begin
            if (N==0)
                result = 1;
            else   
                result = fibonacci(N-1)*fibonacci(N-1);

            fibonacci = result;
        end
    endfunction

    initial begin
        #1 $display ($time, " fibonacci(2) = %d", fibonacci(2));
        #1 $display ($time, " fibonacci(5) = %d", fibonacci(5));
        #1 $display ($time, " fibonacci(2) = %d", fibonacci(10));
        #1 $display ($time, " fibonacci(2) = %d", fibonacci(15));
    end

endmodule