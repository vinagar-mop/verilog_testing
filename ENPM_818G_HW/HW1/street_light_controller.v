module street_light_controller(
    output [1:0] street_light1,
    output [1:0] street_light2,
    output [1:0] street_light3,
    output [1:0] street_light4,
    input button_pushed,
    input clk,
    input reset);

    reg north_south_street_light_controller = 1'b0;
    reg east_west_street_light_controller = 1'b0;

    reg patch_switches = 1'b0;

    reg [1:0] current_light_state1;
    reg [1:0] current_light_state2;
    reg [1:0] current_light_state3;
    reg [1:0] current_light_state4;

    reg [3:0] startuptime = 4'b0000;

    light_controller LIGHT1(
        .set_light_color(street_light1),
        .clk(clk),
        .car_has_arrived(button_pushed),
        .current_light_state(current_light_state1),
        .street_light_controller(north_south_street_light_controller)
    );

    light_controller LIGHT3(
        .set_light_color(street_light3),
        .clk(clk),
        .car_has_arrived(button_pushed),
        .current_light_state(current_light_state3),
        .street_light_controller(north_south_street_light_controller)
    );

    light_controller LIGHT2(
        .set_light_color(street_light2),
        .clk(clk),
        .car_has_arrived(button_pushed),
        .current_light_state(current_light_state2),
        .street_light_controller(east_west_street_light_controller)
    );

    light_controller LIGHT4(
        .set_light_color(street_light4),
        .clk(clk),
        .car_has_arrived(button_pushed),
        .current_light_state(current_light_state4),
        .street_light_controller(east_west_street_light_controller)
    );

    always @(*) begin
        $monitor("Street_light 1 = %2b, Street_light 3 = %2b, 1&3_con = %b, Street_light 2 = %2b, Street_light 4 = %2b, 2&4_con = %b, push button = %d, reset = %d, clock = %d",
                 street_light1,
                 street_light3,
                 north_south_street_light_controller,
                 street_light2,
                 street_light4,
                 east_west_street_light_controller,
                 button_pushed,
                 reset,
                 clk);
    end

    always @(posedge reset) begin
        current_light_state1 = 2'b00;
        current_light_state2 = 2'b11;
        current_light_state3 = 2'b00;
        current_light_state4 = 2'b11;
        patch_switches = 1'b1;

        north_south_street_light_controller = patch_switches;
        east_west_street_light_controller = !patch_switches;
    end

    always @(posedge button_pushed) begin
        // flip the bits for the street light controllers once the corresponding lights are set
        if (((street_light1 & street_light3) ^ 
             (street_light2 & street_light4)) == 2'b11) begin
            // Light 2 & 4
            east_west_street_light_controller = patch_switches;
            // Light 1 & 3
            north_south_street_light_controller = !patch_switches;

            // // Patch Switches
            patch_switches = !patch_switches;
        end
    end

    always @(posedge clk) begin
        current_light_state1 = street_light1;
        current_light_state2 = street_light2;
        current_light_state3 = street_light3;
        current_light_state4 = street_light4;
    end

endmodule