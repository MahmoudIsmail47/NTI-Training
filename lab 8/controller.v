module controller (
    input [2:0] phase,
    input [2:0] opcode,
    input zero,
    output reg sel,
    output reg rd,
    output reg ld_ir,
    output reg halt,
    output reg inc_pc,
    output reg ld_ac,
    output reg wr,
    output reg ld_pc,
    output reg data_e
);

localparam INST_ADDR = 3'b000,
    INST_FETCH = 3'b001,
    INST_LOAD = 3'b010,
    IDLE = 3'b011,
    OP_ADDR = 3'b100,
    OP_FETCH = 3'b101,
    ALU_OP = 3'b110,
    STORE = 3'b111;

reg alu_op;

always @ (*) begin
    sel = 1'b0;
    rd = 1'b0;
    ld_ir = 1'b0;
    halt = 1'b0;
    inc_pc = 1'b0;
    ld_ac = 1'b0;
    wr = 1'b0;
    ld_pc = 1'b0;
    data_e = 1'b0;
    if ((opcode == 3'b010) || (opcode == 3'b011) || (opcode == 3'b100) || (opcode == 3'b101)) 
        alu_op = 1'b1;
    else
        alu_op = 1'b0;
    case (phase)
        INST_ADDR:
            sel = 1'b1;
        INST_FETCH: begin
            sel = 1'b1;
            rd = 1'b1;
        end
        INST_LOAD: begin
            sel = 1'b1;
            rd = 1'b1;
            ld_ir = 1'b1;            
        end
        IDLE: begin
            sel = 1'b1;
            rd = 1'b1;
            ld_ir = 1'b1;            
        end
        OP_ADDR: begin
            inc_pc = 1'b1;
            halt = ~(|opcode);
        end
        OP_FETCH: begin
            rd = alu_op;
        end
        ALU_OP: begin
            rd = alu_op;
            inc_pc = ((opcode == 3'b001) && zero);
            ld_pc = &opcode;
            data_e = (opcode == 3'b110);
        end
        STORE: begin
            rd = alu_op;
            ld_ac = alu_op;
            ld_pc = &opcode;
            wr = (opcode == 3'b110);
            data_e = (opcode == 3'b110);
        end
    endcase
end
endmodule