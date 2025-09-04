module register #(
    parameter WIDTH = 8
)(
    input [WIDTH-1 : 0] data_in,
    input clk,
    input rst,
    input load,
    output reg [WIDTH-1 : 0] data_out
);

always @ (posedge clk) begin
    if (rst)
        data_out <= 8'b0;
    else begin
        if (load)
            data_out <= data_in;
    end
end
endmodule