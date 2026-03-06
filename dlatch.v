module dlatch(
    input d,
    input reset,
    output q,
    output q_not);

    reg mem = 1;
    wire out;

    always (*) begin
        if (posedge reset) begin
            mem = 0;
        end
        
    end
    