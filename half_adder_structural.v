module half_adder_structural(
    input a,
    input b,
    output sum,
    output carry
    );

    // sewu uses continuous assignments
    xor XOR1 (sum, a, b); // instance a XOR gate
    and AND1 (carry, a, b);
endmodule