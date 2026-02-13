'timescale 1us/1ns
module td_logic(
    // no inputs here ;)
    );

    reg a;
    reg b;
    wire c;

    // Instantiate the DUT
    some_log LOGIC(
        .a(a),
        .b(b),
        .c(c)
    );

    // Toggle a and b
    initial begin
        $monitor(" a = %b, b = %b, c = %b",a, b, c);
        #1; a = 0; b = 0;
        #1; a = 1; b = 0;
        #1; a = 1; b = 0;
        #1; a = 1; b = 0;
        #1;
    end

endmodule
