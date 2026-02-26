#~/sh/bash

iverilog -o street_light_controller_tb.vvp light_controller.v street_light_controller.v street_light_controller_tb.v

vvp street_light_controller_tb.vvp