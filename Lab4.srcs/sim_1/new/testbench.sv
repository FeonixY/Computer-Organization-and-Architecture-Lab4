module testbench( );
logic clk, reset;
logic [31:0] writedata, dataadr;
logic memwrite;

top_module tm(clk, reset, writedata, dataadr, memwrite);

initial
begin
    reset <= 1;
    #22;
    reset <= 0;
end

always
begin
    clk <= 1;
    #5;
    clk <= 0;
    #5;
end

endmodule

