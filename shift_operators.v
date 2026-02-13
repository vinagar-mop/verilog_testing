module shift_operators();

    reg [11:0] a = 12'b0101_1010_1101;
    reg [11:0] b;

    initial begin
        $monitor