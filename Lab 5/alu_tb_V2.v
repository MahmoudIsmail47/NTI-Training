module alu_tb_V2 ();

parameter N = 4;

reg [N-1 : 0] operand_1;
reg [N-1 : 0] operand_2;
reg [2:0] opcode;

wire [2*N-1 : 0] out;
wire status;

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

initial begin
    wrong = 0;
    correct = 0;
    driver (4'b11,4'b11,3'b00);
    check (8'b110,1'b0);
    driver (4'b11,4'b11,3'b1);
    check (8'b000,1'b1);
    driver (4'b11,4'b11,3'b10);
    check (8'b1001,1'b0);
    driver (4'b11,4'b11,3'b100);
    check (8'b11,1'b0);
    driver (4'b11,4'b11,3'b101);
    check (8'b11,1'b0);
    driver (4'b11,4'b11,3'b110);
    check (8'b0,1'b1);
    $stop;
end
endmodule