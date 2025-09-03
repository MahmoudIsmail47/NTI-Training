module FSM_ex (
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

always @ (*) begin
    case (cs)
        s0: begin
            y = {1'b1 , 1'b0};
            if (a && b) begin
                ns = s2;
                y = {1'b1 , 1'b1};
            end
            else if (a && !b)
                ns = s1;
            else 
                ns = s0;
        end
        s1: begin
            y = {1'b1 , 1'b0};
            if (a)
                ns = s0;
            else
                ns = s1;
        end
        s2: begin
            y = {1'b0 , 1'b0};
            ns = s0;
        end
    endcase
end
endmodule