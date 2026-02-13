module som_logic (
    input a,
    input b,
    output c
    );


    // Declare internal nets
    wire a_not;
    wire a_or_b;

    // The order of the assignmets in NOT important
    assign c = a_or_b;
    assign a_not = ~a;
    assign a_or_b = a | b;

endmodule
