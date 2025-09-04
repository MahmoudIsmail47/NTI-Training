module rising_edge_moore (
    input rst,
    input clk,
    input level,
    output reg tck
);

localparam s0 = 2'b0, s1 = 2'b1, s2 = 2'b10, s3 = 2'b11;
reg [1:0] cs, ns;

always @ (posedge clk) begin
    if (rst)
        cs <= s0;
    else
        cs <= ns;
end

always @ (*) begin
    case (cs)
        s0: begin
            tck = 1'b0;
            if (level)
                ns = s1;
            else
                ns = s0;
        end
        s1: begin
            tck = 1'b1;
            ns = s2;
        end
        s2: begin
            tck = 1'b0;
            if (level)
                ns = s2;
            else
                ns = s3;
        end
        s3: begin
            tck = 1'b1;
            ns = s0;
        end
    endcase
end
endmodule