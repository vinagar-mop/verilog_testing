module operators_precedence();

    reg[3:0] a;
    integer b;

    initial begin
        #1; a = ~4'b1110 & |4'b1000; // unary executed befor bit-wise
        // ~4'b1110 = 4'b0001, |4'b1000 = 1'b1, 4'b0011 & 1'b1 = 4'b0001
        $display("a = %b", a);

        #1; a = ~4'b1100 & |4'b1000; // unary executed befor bit-wise
        // ~4'b1100 = 4'b0011, |4'b1000 = 1'b1, 4'b0011 & 1'b1 = 4'b0001
        $display("a = %b", a);

        #1; a = ~4'b1110 & |4'b1000; // unary executed befor bit-wise
        // ~4'b1110 = 4'b0001, |4'b1000 = 1'b1, 4'b0011 & 1'b1 = 4'b0001
        $display("a = %b", a);

        

    end 
endmodule