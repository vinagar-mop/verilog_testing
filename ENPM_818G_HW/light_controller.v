module light_controller(

    // The set state of the light currently
    // 0 = red
    // 3 = green
    // 1 = yellow
    output reg [1:0] set_light_color,

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
    input street_light_controller);

    reg [3:0] yield_time = 4'd0;

    // initial begin
    //     $monitor("yield time = %b", yield_time);
    // end


    always @(posedge clk) begin
        if (current_light_state == 2'b11) begin 
            if(street_light_controller == 1'b0) begin
                //if (car_has_arrived == 1'b1 ) begin // TODO: implement the clock
                assign set_light_color = 2'b01; // Setting light to YIELD
                //$display("we made it in the green state moving to yellow and color set to %d", set_light_color); 
                //end
            end
        end
        else if (current_light_state == 2'b01) begin
            //if (street_light_controller == 1'b1) begin
                yield_time = yield_time + 4'd1; // incrementing yield time
                if (yield_time >= 4'd5) begin
                    assign set_light_color = 2'b00;    // setting the lights to RED
                    yield_time = 4'd0; // incrementing yield time
                end
            //end
        end
        else if (current_light_state == 2'b00) begin 
            //$display("we made it in the red state"); 
            if (street_light_controller == 1'b1) begin
                assign set_light_color = 2'b11; // Setting light to GREEN
            end
        end
        else begin
            assign set_light_color = current_light_state;
        end
    end

endmodule