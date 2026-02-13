module literal_values();

    reg[7:0] my_var;

    // all printouts of the different displays
    initial begin
        my_var = 8'd137;          // Decimal
        $display("myvar = %d", my_var);

        my_var = 8'h89;          // Hexidecimal
        $display("myvar = %x", my_var);

        my_var = 8'b1000_1001;  // Binary
        $display("myvar = %b", my_var);

        my_var = 8'o211;       // Octal
        $display("myvar = %o", my_var);

        my_var = 8'hZ1;        // zzzz_0001
        $display("myvar = %b", my_var);

        my_var = 1'b1;        // 8 bit variable gets 1 bit value
        $display("myvar = %d", my_var);

        my_var = 12'b1111_1111_0000;    // 8 bit variable gets 12 bit value
        $display("myvar = %b", my_var);
    end

endmodule