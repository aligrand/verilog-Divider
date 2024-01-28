module TTT;
    reg[7:0] a, b;
    reg s;
    wire[7:0] o;

    A_module am(a, b, s, o);

    initial begin
        a = 8'b11010; b = 8'b101011; s = 1'b0;  
    end
endmodule