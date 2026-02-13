module light_controller(

    // Clock input
    // Clk
    input clk,

    // Car has arrived
    input car_has_arrived,

    // The state of the light currently
    // 0 = red
    // 3 = green
    // 1 = yellow
    input [1:0] current_light_state,
    
    // Street Light State
    // 1 can allow green
    // 0 can't allow green
    input street_light_controller,

    // The set state of the light currently
    // 0 = red
    // 3 = green
    // 1 = yellow
    output reg [1:0] set_light_color);

    reg [3:0] yield_time = 0;
    reg [8:0] go_time = 0;

    always @(set_light_color) begin
        $monitor("\n\t MON current_light_state = %d,\n street_light_controller = %d,\n set_light_color = %d\n",
                current_light_state,
                street_light_controller,
                set_light_color);
    end

    // keep track GREEN
    // Transitioning to YIELD
    always @(posedge clk or posedge car_has_arrived) begin
        if(!street_light_controller) begin
            if (current_light_state == 2'b11) begin 
                if (car_has_arrived) begin // TODO: implement the clock
                    assign set_light_color = 2'b01; // Setting light to YIELD
                end
            end
        end
    end

    // Keeping track of YIELD 
    // Transitioning it to GREEN
    always @(posedge clk) begin
        if (current_light_state == 2'b01) begin 
            if (yield_time < 4'd5) begin
                yield_time = yield_time + 1; // incrementing yield time
            end
            else if (yield_time >= 4'd5) begin
                assign set_light_color = 2'b00;    // setting the lights to RED
            end
        end
    end

    // Keeping track of RED
    // Transitioning to GREEN
    initial begin
        if (street_light_controller) begin
            assign set_light_color = 2'b11; // Setting light to GREEN
        end
    end

endmodule