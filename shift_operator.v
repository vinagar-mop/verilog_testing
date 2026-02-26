module shift_operators();

    reg [11:0] a = 12'b0101_1010_1101; // 12 bit value (unsigned)
    reg [11:0] b;

    initial begin
        $monitor("MON a = %12b, b = %12b, a = %0d, b = %0d", a, b, a, b);
    end

    initial begin
        b = a << 1;
        #1;
        b = 0;

        #1; b = a * 2; // write on 1 line to save space

        #1; b = a << 5;
        #1; b = a >> 2;
        #1; b = a >> 7;
        #1; b = a << 1;
        #1; b = (a << 1) >> 6; // always use parenthesys

        // Change the values of a and b and perform different logical shift between them
        // Ex: a = a << 12

    end
endmodule