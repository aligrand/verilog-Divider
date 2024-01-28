module RegA_module (
    input[7:0] DataIn, input Clk, Reset,
    output reg[7:0] DataOut
);
    initial begin
        DataOut[7:0] = 8'b0;
    end

    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            DataOut[7:0] = 8'b0;
        end
        else begin
            DataOut[7:0] = DataIn[7:0];
        end
    end
endmodule
