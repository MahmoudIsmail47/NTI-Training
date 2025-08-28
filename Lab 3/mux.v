module mux #(
    parameter WIDTH = 5
)(
    input [WIDTH-1 : 0] in0,
    input [WIDTH-1 : 0] in1,
    input sel,
    output reg [WIDTH-1 : 0] mux_out
);

always @ (*) begin
    case (sel)
        1'b0:
            mux_out = in0;
        1'b1:
            mux_out = in1;
    endcase
end
endmodule