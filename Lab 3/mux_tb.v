module mux_tb ();

parameter WIDTH = 5;

reg [WIDTH-1 : 0] in0;
reg [WIDTH-1 : 0] in1;
reg [WIDTH-1 : 0] mux_out_tb;
reg sel;

wire [WIDTH-1 : 0] mux_out;

mux #(.WIDTH(WIDTH)) DUT (.sel(sel), .in0(in0), .in1(in1), .mux_out(mux_out));

initial begin
    in0 = 5'b11111;
    in1 = 5'b00001;
    sel = 1'b0;
    #10
    mux_out_tb = 5'b11111;
    if (mux_out != mux_out_tb) $display ("Error in selection 0");
    #5
    sel = 1'b1;
    #10
    mux_out_tb = 5'b00001;
    if (mux_out != mux_out_tb) $display ("Error in selection 1");
    #5
    $stop;
end
endmodule