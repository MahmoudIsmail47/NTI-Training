module alu_tb_V3 ();

parameter N = 4;

reg [N-1 : 0] operand_1;
reg [N-1 : 0] operand_2;
reg [2:0] opcode;

wire [2*N-1 : 0] out;
wire status;

reg [2*N-1 : 0] out_exp;
reg status_exp;


integer correct, wrong;

alu #(.N(N)) DUT (.operand_1(operand_1), .operand_2(operand_2), .opcode(opcode), .out(out), .status(status));

//driver task
task driver;
    input [N-1 : 0] o1,o2;
    input [2:0] op;
    begin
        operand_1 = o1;
        operand_2 = o2;
        opcode = op;
        #10;
    end
endtask

// check task
task check;
    input [2*N-1 : 0] out_exp;
    input status_exp;
    begin
        if (out != out_exp) begin
            $display ("Error in out = %b" , out);
            wrong = wrong + 1;
        end
        else begin
            correct = correct + 1;
        end
        
        if (status != status_exp) begin
            $display ("Error in status = %b" , status);
            wrong = wrong + 1;
        end
        else begin
            correct = correct + 1;
        end
    end
endtask

// golden model
task golden_model;
    input [N-1 : 0] operand_1_;
    input [N-1 : 0] operand_2_;
    input [2:0] opcode_;

    output [2*N-1 : 0] out_;
    output status_;
    begin
        if (opcode_ == 3'b000)
            out_ = operand_1_ + operand_2_;
        else if (opcode_ == 3'b001)
            out_ = operand_1_ - operand_2_;
        else if (opcode_ == 3'b010)
            out_ = operand_1_ * operand_2_;
        else if (opcode_ == 3'b100)
            out_ = operand_1_ & operand_2_;
        else if (opcode_ == 3'b101)
            out_ = operand_1_ | operand_2_;
        else if (opcode_ == 3'b110)
            out_ = operand_1_ ^ operand_2_;
        else
            out_ = {N{1'b0}};

        if (out_ == {N{1'b0}})
            status_ = 1'b1;
        else
            status_ = 1'b0;
    end
endtask

initial begin
    wrong = 0;
    correct = 0;
    repeat (100) begin
        driver ($random , $random , $random);
        golden_model (
            operand_1,
            operand_2,
            opcode,
            out_exp,
            status_exp
        );
        #5
        check (out_exp , status_exp);
    end
    $stop;
end
endmodule