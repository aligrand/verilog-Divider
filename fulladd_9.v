module FA_9 (
    input[8:0] X, Y, input Cin,
    output[8:0] S, output Cout 
);
    wire w[0:7];

    // first FA_1
    FA_1 fa0(X[0], Y[0], Cin, S[0], w[0]);

    // middle FA_1
    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : faMiddle
            FA_1 fa(X[i], Y[i], w[i - 1], S[i], w[i]);
        end
    endgenerate

    // last FA_1
    FA_1 fa9(X[8], Y[8], w[7], S[8], Cout);
endmodule
