module LFSR #(
    parameter WIDTH = 4
)(
    input arst_n,
    input si,
    input en,
    input clk,
    output reg [3:0] q
);

always @ (posedge clk or negedge arst_n) begin
    if (!arst_n)
        q <= {WIDTH{1'b0}};
    else if (en) begin
        q <= {q[3] ^ q[2] , q[WIDTH-1 : 1]};
    end
    else if (!en)
        q <= {si , q[WIDTH-1 : 1]};
end
endmodule