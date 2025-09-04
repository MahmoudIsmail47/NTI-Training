module rising_edge_mealy (
    input clk,
    input rst,
    input level,
    output reg tck
);

localparam s0 = 1'b0, s1 = 1'b1;
reg cs, ns;

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
            if (level) begin
                ns = s1;
                tck = 1'b1;
            end
            else
                ns = s0;
        end
        s1: begin
            tck = 1'b0;
            if (level)
                ns = s1;
            else begin
                tck = 1'b1;
                ns = s0;
            end
        end
    endcase
end
endmodule