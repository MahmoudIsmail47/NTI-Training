module full_adder_structural (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

wire w1, w2, w3;

half_adder HA0 (.a(a), .b(b), .sum(w1), .cout(w2));
half_adder HA1 (.a(w1), .b(cin), .sum(sum), .cout(w3));
assign cout = w2 | w3;

endmodule