module math_operators();

    integer a = 2;
    integer b = 3;
    integer results;

    initial begin
        $dumpfile("math_operators.vcd");
        $dumpvars(0, math_operators);
        $monitor("MON my_val1=%b, my_val2=%b, result=%b", my_val1, my_val2, result);
    end

    initial begin
        result = a ** b;
        #1;
        result = b ** a;

        #1 a= 177; b= 12;
        result = a * b; // multiplication
    end
endmodule