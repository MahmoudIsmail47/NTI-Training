module testbench ();
reg clk;
reg rst;
reg level;
wire tck;

rising_edge_mealy DUT (
    .clk(clk),
    .rst(rst),
    .level(level),
    .tck(tck)
);

initial begin
	clk = 0;
	forever
	#10 clk = ~clk;
end

initial begin
    rst = 1;
    level = 0;
    @(negedge clk);
    rst = 0;
    level = 1;
    #10
    level = 0;
    #10
    level = 1;
end


endmodule