module Counter_8 (
    input Clk, Reset,
    output reg[7:0] Count
);
    initial begin
        Count = 7'b0;
    end
    
    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            Count[7:0] = 8'b0;
        end else begin
            Count[7:0] = Count[7:0] + 8'b1;
        end
    end
endmodule
