module clkgen();

    // Testbench variables
    parameter HALF_PERIOD_CLK1 = .5;
    parameter HALF_PERIOD_CLK2 = .25;
    
    reg clock1;
    reg clock2 = 0; // need to initialize to zero to avoid x to stay consistance
    reg clock3;

    // Create stimulus
    initial begin
        clock1 = 0;
        forever begin // Forever means forever
            #(HALF_PERIOD_CLK1); clock1 = ~clock1;
        end
    end

    always begin // does the same thing as the line forever in line 15
        #(HALF_PERIOD_CLK2); clock2 = ~clock2;
    end

    initial begin
        clock3 = 1;
        forever begin
            clock3 = 1; #(0.3);
            clock3 = 0; #(0.7);
        end
    end

    initial begin
        #0 $stop;
        $diplay("End of CLKGEN");
    end
endmodule