module testbench;
    reg[7:0] A, B;
    wire[7:0] DQ, DR;
    reg Start, Clk, Reset;
    wire Done;

    always #10 Clk = ~Clk;

    Divider div(.A(A), .B(B), .Start(Start), .Clk(Clk), .Reset(Reset), .DQ(DQ), .DR(DR), .Done(Done));

    initial begin
        Reset = 1'b0;
        Clk = 1'b0;
        Start = 1'b0;
        A = 8'b0;
        B = 8'b1;

        #60;

        A = 8'd50; B = 8'd3;
        Start = 1'b1;
        #20;
        Start = 1'b0;

        #30;

        Start = 1'b1;
        #20;
        Start = 1'b0;

        #100;

        Reset = 1'b1;
        #20;
        Reset = 1'b0;

        Start = 1'b1;
        #20;
        Start = 1'b0;
    end
endmodule
