module FA_1 (
    input X, Y, Cin,
    output S, Cout
);
    wire w[0:2];

    // first HA
    xor(w[0], X, Y);
    and(w[1], X, Y);

    // second HA
    xor(S, w[0], Cin);
    and(w[2], w[0], Cin);

    or(Cout, w[2], w[1]);
endmodule