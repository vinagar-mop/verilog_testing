module easy_vectors_example();

    reg [7:0] a = 0;    // 8bit register
    reg [6:0] b = 0;    // 7bit register
    reg [7:0] d = 0;    // 8bit register

    wire [1:0] c;       // 2bit net

    // Continuous assignment between a net and a register
    // c[1] = s[3];
    // c[0] = s[2];
    assign c[1:0] = a[3:2];

    // Procedure used to continuously monitor 'a', 'b', 'c' and 'd'
    initial begin
        $monitor("PROC2 a=%b, b=%b, c=%b, d=%b", a, b, c, d);
    end

    initial begin
        // Change only the value of 'a' to see the effect on 'c'
        #1 a = 1;
        #1 a = 8'b1111_0101;
        #1 a = 8'b1111_1000;
        #1 a = 8'b0000_1000;
        #1 a = 8'b0;

        #1 b = 7'b111_1111; // Change the value of b
        #1 d[7:4] = b[6:3]; // Change the value of d

        #1 a = 8'b0000_1110; //Change the value
        #1 d = {a[3:0], b[3:0]}; // Concadination
        #1 d = {b[3:0], a[7:4]}; // Concadination
    end
endmodule