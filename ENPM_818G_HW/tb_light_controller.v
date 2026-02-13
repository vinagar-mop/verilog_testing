module tb_light_controller ();

    // Clock input
    // Clk
    reg clk;

    // Car has arrived
    reg car_has_arrived;

    // The state of the light currently
    // 0 = red
    // 3 = green
    // 1 = yellow
    reg [1:0] current_light_state;
    
    // Street Light State
    // 1 can allow green
    // 0 can't allow green
    reg street_light_controller;

    // The set state of the light currently
    // 0 = red
    // 3 = green
    // 1 = yellow
    reg [1:0] set_light_color;

    light_controller LOGIC(
        .clk(clk),
        .car_has_arrived(car_has_arrived),
        .current_light_state(current_light_state),
        .street_light_controller(street_light_controller),
        .set_light_color(set_light_color)
    );

    initial begin 
        $monitor("clk=%d, car_has_arrived=%d", clk, car_has_arrived);
    end

    initial begin
        #1; // wait 1 time unit

    end
    
endmodule
    