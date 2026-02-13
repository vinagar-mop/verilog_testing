module logical_operators_usage();

    reg [2:0] my_val1 = 3'b111; // 3bit variable
    reg [3:0] my_val2 = 4'b0000; //4bit variable

    // Procedure used to generate stimulus
    initial begin
        #file
        #1;
        if (!my_val1) begin
            // execute some code 
            $display("GREAT! my_val1=%b", my_val1);
        end else begin
            $display(":( I expected my_val1=0 but my_val1=%b", my_val1);
            // execute some code
        end

        #1;
        if (!my_val2) begin
            $display("GREAT! my_val2=%b", my_val2);
        end else begin
            $display(":( I expected my_val2=0 but my_val2=%b", my_val2);
        end

        #1;
        if (!my_val2) begin
            $display("GREAT! my_val1=%b my_val2=%b", my_val1, my_val2);
        end else begin
            $display(":( I expected my_val1!=0 AND my_val2=0 but my_val1=%b and my_val2=%b", my_val1, my_val2);
        end

        #1;
        while (my_val2 < 3) begin
            $display("WHILE LOOP my_val2=%d", my_val2);
            my_val2 = my_val2 + 1;
        end

        // Change the values of my_val1/2 and with the if() and while() statements
        // EX: my_val2 = 4'b0111

    end
endmodule