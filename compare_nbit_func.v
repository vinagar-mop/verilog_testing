module compare_nbit_func
    // Parameter section
    #( parameter CMP_WIDTH = 4)
    // Ports section
    (input [CMP_WIDTH-1:0] a,
     input [CMP_WIDTH-1:0] b,
     output reg greater,
     output reg equal,
     output reg smaller);

     // Systhesizable functions area (parameterized)
     // All 3 bits are combined into a single output

     function [2:0] compare (input [CMP_WIDTH-1:0] a, input [CMP_WIDTH-1:0] b);
        // Local Varibles
        reg greater_local;
        reg equal_local;
        reg smaller_local;

        begin // The Acual Computation from the function
            greater_local = (a>b);
            equal_local   = (a==b);
            smaller_local = (a<b);
            compare = (greater_local, equal_local, smaller_local);
        end
     endfunction

     always @(*) begin
        (greater, equal, smaller) = compare(a,b);
     end

endmodule