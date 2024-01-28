module A_module (
    input[7:0] A, A_prime, input run,
    output[7:0] O
);
    genvar i;
    for (i = 0; i < 8; i = i + 1) begin
        assign O[i] = (~run & A_prime[i]) | (run & A[i]);
    end
endmodule
