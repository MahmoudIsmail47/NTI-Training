module full_adder_data_flow (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

assign {cout,sum} = a + b + cin;

endmodule