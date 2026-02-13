
`timescale 1ns/100ps

module bitwise_operators(
    // no inputs here
    );

    reg [5:0] x = 0;
    reg [5:0] y = 0;
    reg [5:0] result = 0;


    initial begin 
        $dumpfile("wave.vcd");
        $dumpvars(0, bitwise_operators);
        $monitor("MON x=%b, y=%b, results=%b", x, y, result);
    end

    initial begin
        #1;
        x = 6'b00_0101;
        y = 6'b11_0001;
        result = x & y; // AND

        #1;
        result = ~(x & y);

        #1;
        x = 6'b10_0101;
        y = 6'b01_1011;
        result = x | y; // OR

        #1
        result = ~(x | y);

        #1
        x = 6'b01_0110;
        y = 6'b01_1011;
        result = x ^ y; // XOR

        #1
        result = x ~^ y;  // NXOR

        #1
        x = y;
        result = ~(x ^ y);
    end
endmodule