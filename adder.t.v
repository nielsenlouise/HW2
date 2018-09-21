// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    // behavioralFullAdder adder (sum, carryout, a, b, carryin);
    structuralFullAdder adder (sum, carryout, a, b, carryin);

    initial begin
    $dumpfile("sadder.vcd");
    $dumpvars();
    $display("Carryin A B | Sum Carryout | E Sum E Carryout");
    carryin=0;a=0;b=0; #1000
    $display("      %b %b %b |  %b     %b     |   0        0    ", carryin, a, b, sum, carryout);
    carryin=0;a=0;b=1; #1000
    $display("      %b %b %b |  %b     %b     |   1        0    ", carryin, a, b, sum, carryout);
    carryin=0;a=1;b=0; #1000
    $display("      %b %b %b |  %b     %b     |   1        0    ", carryin, a, b, sum, carryout);
    carryin=0;a=1;b=1; #1000
    $display("      %b %b %b |  %b     %b     |   0        1    ", carryin, a, b, sum, carryout);
    carryin=1;a=0;b=0; #1000
    $display("      %b %b %b |  %b     %b     |   1        0    ", carryin, a, b, sum, carryout);
    carryin=1;a=0;b=1; #1000
    $display("      %b %b %b |  %b     %b     |   0        1    ", carryin, a, b, sum, carryout);
    carryin=1;a=1;b=0; #1000
    $display("      %b %b %b |  %b     %b     |   0        1    ", carryin, a, b, sum, carryout);
    carryin=1;a=1;b=1; #1000
    $display("      %b %b %b |  %b     %b     |   1        1    ", carryin, a, b, sum, carryout);
    $finish();
    end
endmodule
