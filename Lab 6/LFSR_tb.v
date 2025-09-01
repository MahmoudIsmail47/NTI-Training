module LFSR_tb ();

parameter WIDTH = 4;
reg arst_n;
reg si;
reg en;
reg clk;
wire [3:0] q;

integer i;

LFSR #(.WIDTH(WIDTH)) DUT (.arst_n(arst_n), .si(si), .en(en), .clk(clk), .q(q));

initial begin
	clk = 0;
	forever
	#10 clk = ~clk;
end

initial begin
    arst_n = 0;
    for (i = 0; i < 10; i = i + 1) begin
        si = $random;
        en = $random;
        if (q != 4'b0) $display ("Error in reset");
        @(negedge clk);
    end
    arst_n = 1;
    en = 0;
    si = 1;
    @(negedge clk);
    si = 1;
    @(negedge clk);
    si = 1;
    @(negedge clk);
    en = 1;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    $stop;
end
endmodule