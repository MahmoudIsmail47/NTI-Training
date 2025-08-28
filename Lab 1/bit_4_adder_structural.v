module bit_4_adder_structural (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

wire w1, w2, w3;

full_adder_data_flow FA0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(w1));
full_adder_data_flow FA1 (.a(a[1]), .b(b[1]), .cin(w1), .sum(sum[1]), .cout(w2));
full_adder_data_flow FA2 (.a(a[2]), .b(b[2]), .cin(w2), .sum(sum[2]), .cout(w3));
full_adder_data_flow FA3 (.a(a[3]), .b(b[3]), .cin(w3), .sum(sum[3]), .cout(cout));

endmodule