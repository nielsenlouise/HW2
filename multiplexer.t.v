// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg address0, address1;
  reg in0, in1, in2, in3;
  wire out;

  // behavioralMultiplexer multiplexer (out, address0, address1, in0, in1, in2, in3);
  structuralMultiplexer multiplexer (out, address0, address1, in0, in1, in2, in3);

  initial begin
  $dumpfile("smultiplexer.vcd");
  $dumpvars();
  $display("A0 A1 | I0 I1 I2 I3 | Out | Expected Output");
  address0=0;address1=0;in0=0;in1=1;in2=1;in3=1; #1000
  $display(" %b  %b |  %b  %b  %b  %b |   %b | False", address0, address1, in0, in1, in2, in3, out);
  address0=0;address1=0;in0=1;in1=0;in2=0;in3=0; #1000
  $display(" %b  %b |  %b  %b  %b  %b |   %b | True", address0, address1, in0, in1, in2, in3, out);
  address0=1;address1=0;in0=1;in1=0;in2=1;in3=1; #1000
  $display(" %b  %b |  %b  %b  %b  %b |   %b | False", address0, address1, in0, in1, in2, in3, out);
  address0=1;address1=0;in0=0;in1=1;in2=0;in3=0; #1000
  $display(" %b  %b |  %b  %b  %b  %b |   %b | True", address0, address1, in0, in1, in2, in3, out);
  address0=0;address1=1;in0=1;in1=1;in2=0;in3=1; #1000
  $display(" %b  %b |  %b  %b  %b  %b |   %b | False", address0, address1, in0, in1, in2, in3, out);
  address0=0;address1=1;in0=0;in1=0;in2=1;in3=0; #1000
  $display(" %b  %b |  %b  %b  %b  %b |   %b | True", address0, address1, in0, in1, in2, in3, out);
  address0=1;address1=1;in0=1;in1=1;in2=1;in3=0; #1000
  $display(" %b  %b |  %b  %b  %b  %b |   %b | False", address0, address1, in0, in1, in2, in3, out);
  address0=1;address1=1;in0=0;in1=0;in2=0;in3=1; #1000
  $display(" %b  %b |  %b  %b  %b  %b |   %b | True", address0, address1, in0, in1, in2, in3, out);
  $finish();
  end

endmodule
