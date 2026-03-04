//`timescale 1ns/1ps
module light_controller_tb();

    // The set state of the light currently
    // 0 = red
    // 3 = green
    // 1 = yellow
    wire [1:0] set_light_color = 0;

    // Clock input
    // Clk
    reg clk = 0;

    // Car has arrived
    reg car_has_arrived = 0;

    // The state of the light currently
    // 0 = red
    // 3 = green
    // 1 = yellow
    reg [1:0] current_light_state = 0;
    
    // Street Light State
    // 1 can allow green
    // 0 can't allow green
    reg street_light_controller = 0;

    light_controller LOGIC(
        .set_light_color(set_light_color),
        .clk(clk),
        .car_has_arrived(car_has_arrived),
        .current_light_state(current_light_state),
        .street_light_controller(street_light_controller)
    );

    initial begin 
        $dumpfile("light_controller_tb.vcd");
        $dumpvars(0, light_controller_tb);
        $monitor("MON current_light_state = %d, street_light_controller = %d, car_has_arrived = %d, set_light_color = %d\n",
                current_light_state,
                street_light_controller,
                car_has_arrived,
                set_light_color);
    end

    initial begin
        forever #1 clk = !clk;
    end

    initial begin
        #10; // wait 10 time unit
        // Test 1a: when the system is in start up.
        car_has_arrived = 0;
        current_light_state = 0;
        street_light_controller = 0;

        // Test 1b: when the street light enables 
        #10;
        car_has_arrived = 0;
        current_light_state = 0;
        street_light_controller = 1;

        #1000; // wait 10 time unit
        car_has_arrived = 0;
        current_light_state = set_light_color;
        street_light_controller = 1;

        #1000; // wait 10 time unit
        car_has_arrived = 0;
        current_light_state = set_light_color;
        street_light_controller = 1;

        #1000; // wait 10 time unit
        car_has_arrived = 1;
        current_light_state = set_light_color;
        street_light_controller = 0;

        #100000;
        car_has_arrived = 0;
        current_light_state = set_light_color;
        street_light_controller = 0;

        #100000;
        car_has_arrived = 0;
        current_light_state = set_light_color;
        street_light_controller = 0;

        #100000;
        car_has_arrived = 0;
        current_light_state = set_light_color;
        street_light_controller = 1;

        #100000;
        car_has_arrived = 0;
        current_light_state = set_light_color;
        street_light_controller = 1;

        #100000;
        car_has_arrived = 0;
        current_light_state = set_light_color;
        street_light_controller = 0;

        #100000;
        car_has_arrived = 1;
        current_light_state = set_light_color;
        street_light_controller = 0;

        #100000;

        #10; // wait 10 time unit
        $finish();
    end
    
endmodule
    