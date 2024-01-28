module DFlipFlop (
    input D, CLK, PRE_bar, CLR_bar,
    output reg Q, Q_bar
);
    initial begin
        Q = 1'b0;
        Q_bar = 1'b1;
    end

    always @(posedge CLK or negedge PRE_bar or negedge CLR_bar) begin
        if (!PRE_bar) begin
            Q = 1'b1;
            Q_bar = 1'b0;
        end 
        else if (!CLR_bar) begin
            Q = 1'b0;
            Q_bar = 1'b1;
        end
        else begin
            Q = D;
            Q_bar = ~D;
        end
    end
endmodule
