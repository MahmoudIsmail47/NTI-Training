module driver_tb ();

parameter WIDTH = 8;

reg [WIDTH-1 : 0] data_in;
reg data_en;

wire [WIDTH-1 : 0] data_out;

driver #(.WIDTH(WIDTH)) DUT (
    .data_in(data_in),
    .data_en(data_en),
    .data_out(data_out)
);

initial begin
    data_in = 4'h5;
    data_en = 1'b0;
    #10
    if (data_out != {WIDTH{1'bz}}) 
        $display ("Error in enable = 0");
    #5
    data_in = 4'h5;
    data_en = 1'b1;
    #10
    if (data_out != 4'h5) 
        $display ("Error in enable = 1");
    #5
    $stop;
end
endmodule