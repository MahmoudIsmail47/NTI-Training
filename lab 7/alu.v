module alu #(
    parameter WIDTH = 8
)(
    input [WIDTH-1 : 0] in_a,
    input [WIDTH-1 : 0] in_b,
    input [2:0] opcode,
    output reg [WIDTH-1 : 0]alu_out,
    output reg a_is_zero
);

always @ (*) begin
    a_is_zero = ~(|in_a);
    case(opcode)
        3'b010:
            alu_out = in_a + in_b;
        3'b011:
            alu_out = in_a & in_b;
        3'b100:
            alu_out = in_a ^ in_b;
        3'b101:
            alu_out = in_b;
        default:
            alu_out = in_a;
    endcase
end
endmodule