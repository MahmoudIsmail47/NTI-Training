module FSM_tb ();

reg a, b, clk, rst_n;
wire [1:0] y;

FSM_ex_V2 DUT (.clk(clk) , .a(a), .b(b), .y(y), .rst_n(rst_n));

initial begin
	clk = 0;
	forever
	#10 clk = ~clk;
end

initial begin
    rst_n = 0;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    rst_n = 1;
    @(negedge clk);
    repeat (50) begin
    a = $random;
    b = $random;
    @(negedge clk);
    end
    $stop;
end
endmodule