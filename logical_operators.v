module logical_operators();

    reg [2:0] my_val1 = 3'b111;
    reg [3:0] my_val2 = 4'b0000;
    reg result;

    initial begin
        $dumpfile("logical_operators.vcd");
        $dumpvars(0, logical_operators);
        $monitor("MON my_val1=%b, my_val2=%b, result=%b", my_val1, my_val2, result);
    end

    initial begin
        result = !my_val1;
        #1;
        result = !my_val2;

        #1;
        result = my_val1 && my_val2;

        #1;
        result = my_val1 || my_val2;

        #1;
        my_val1 = 3'bx0X; //addding some unkown bits
        result = !my_val1;

        #1;
        result = my_val1 || my_val2;

        #1;
        result = my_val1 && my_val2;
    end
endmodule