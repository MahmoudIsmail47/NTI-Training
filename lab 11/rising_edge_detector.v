module rising_edge_detector (
    input clk,
    input rst,
    input level,
    output reg tck
);

reg off;

always @ (posedge clk) begin
    if (rst || !level) begin
        off <= 1'b1;
        tck <= 1'b0;
    end
    else if (level && off) begin
        tck <= 1'b1;
        off <= 1'b0;
    end
    if (!off) begin
        tck <= 1'b0;
    end
end
endmodule