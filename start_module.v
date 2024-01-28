module Start_module (
    input Start, Clk, check, Reset,
    output reg run
);
    initial begin
        run = 1'b0;
    end
    
    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            run = 1'b0;
        end 
        else begin
            run = (~check) & Start;
        end
    end

    always @(negedge Clk) begin
        if (check) begin
            run = 1'b0;
        end
    end
endmodule
