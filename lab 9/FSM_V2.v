module FSM_ex_V2 (
    input a, b, clk, rst_n,
    output reg [1:0] y
);

localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;
reg [1:0] cs, ns;

always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)
        cs <= s0;
    else
        cs <= ns;
end

// next state block
always @ (*) begin
    case (cs)
        s0: begin
            if (a && b)
                ns = s2;
            else if (a && !b)
                ns = s1;
            else 
                ns = s0;
        end
        s1: begin
            if (a)
                ns = s0;
            else
                ns = s1;
        end
        s2: begin
            ns = s0;
        end
    endcase
end

// mealy signals block
always @ (*) begin
    case (cs)
        s0: begin
            y[1] = 1'b1;
        end
        s1: begin
            y[1] = 1'b1;
        end
        s2: begin
            y[1] = 1'b0;
        end
    endcase
end

// moore signals block
always @ (*) begin
    case (cs)
        s0: begin
            y[0] = 1'b0;
            if (a && b)
                y[0] = 1'b1;
            else 
                y[0] = 1'b0;
        end
        s1: begin
            y[0] = 1'b0;
        end
        s2: begin
            y[0] = 1'b0;
        end
    endcase
end
endmodule