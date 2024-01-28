module Divider (
    input[7:0] A, B, input Start, Clk, Reset,
    output[7:0] DQ, DR, output Done
);
    wire[7:0] A_prime, A_out, RegA_out, RegB_out, RegB_out_bar;
    wire run;
    wire sign;
    wire check = ~sign;
    wire run_bar = ~run;
    wire A_clk = (Clk & run) | (Clk & check);
    wire B_clk = Clk & run;
    wire counter_clk = check & Clk & run_bar;
    wire hole;

    supply1 logic1;
    supply0 logic0;

    // A_M
    A_module A_M(A, A_prime, run, A_out);

    // Start_M
    Start_module Start_M(Start, Clk, check, Reset, run);

    // RegA
    RegA_module RegA(A_out, A_clk, Reset, RegA_out);

    // RegB
    RegB_module RegB(B, B_clk, Reset, RegB_out);
    
    // FA
    genvar i;
    for (i = 0; i < 8; i = i + 1) begin
        assign RegB_out_bar[i] = ~RegB_out[i];
    end
    FA_9 FA({logic0, RegA_out}, {logic1, RegB_out_bar}, logic1, {sign, A_prime}, hole);

    // Counter
    Counter_8 Counter(counter_clk, Reset, DQ);

    // else
    assign DR = RegA_out;
    DFlipFlop done_dff(sign, Clk, logic1, run_bar, Done, hole);
endmodule
