module alu #(
    parameter N = 4
)(
    input [N-1 : 0] operand_1,
    input [N-1 : 0] operand_2,
    input [2:0] opcode,
    output reg [2*N-1 : 0] out,
    output reg status
);

always @ (*) begin
    out = 1'd0;
    case (opcode)
        3'b000:
            out = operand_1 + operand_2;
        3'b001:
            out = operand_1 - operand_2;
        3'b010:
            out = operand_1 * operand_2;
        3'b100:
            out = operand_1 & operand_2;
        3'b101:
            out = operand_1 | operand_2;
        3'b110:
            out = operand_1 ^ operand_2;
        default:
            out = 1'd0;
    endcase
    status = ~(|out);
end
endmodule