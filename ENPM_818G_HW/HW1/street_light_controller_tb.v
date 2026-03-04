`timescale 1ns/1ps
module street_light_controller_tb();

    wire [1:0] street_light1;
    wire [1:0] street_light2;
    wire [1:0] street_light3;
    wire [1:0] street_light4;
    reg button_pushed=0;
    reg clk=0;
    reg reset=0;

    street_light_controller CONTROL1
    (
        .street_light1(street_light1),
        .street_light2(street_light2),
        .street_light3(street_light3),
        .street_light4(street_light4),
        .button_pushed(button_pushed),
        .clk(clk),
        .reset(reset)
    );

    // initial begin
    //     $dumpfile("street_light_controller.vcd");
    //     $dumpvars(0, street_light_controller_tb);
    //     $monitor("Street_light 1 = %2b, Street_light 3 = %2b, Street_light 2 = %2b, Street_light 4 = %2b, push button = %d",
    //              street_light1,
    //              street_light3,
    //              street_light2,
    //              street_light4,
    //              button_pushed);
    // end

    initial begin
        forever #1 clk = !clk;
    end;

    initial begin

        #1;
        reset = 1;
        #1;
        reset = 0;

        #10;
        button_pushed = 0;

        #10;
        button_pushed = 1;
        #1;
        button_pushed = 0;

        #1;
        reset = 1;
        #1;
        reset = 0;

        #500;
        button_pushed = 1;
        #1;
        button_pushed = 0;

        #500;
        button_pushed = 1;
        #1;
        button_pushed = 0;

        #500;
        button_pushed = 1;
        #1;
        button_pushed = 0;


        #1000;
        button_pushed = 0;


        $finish();
    end

endmodule