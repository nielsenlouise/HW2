// Multiplexer circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define NOR nor #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);

    // Input 00
    wire A0norA1;
    wire I0out;
    `NOR norA0A1(A0norA1, address0, address1); // NOR gate produces A0norA1 from A0 and A1
    `AND andAI0(I0out, in0, A0norA1); // AND gate with in0 and A0norA1

    // Input 01
    wire nA1;
    wire A0andnA1;
    wire I1out;
    `NOT A1inv(nA1, address1); // produce not A1 from A1
    `AND andA0nA1(A0andnA1, address0, nA1); // AND gate produces A0andnA1 from A0 and nA1
    `AND andAI1(I1out, in1, A0andnA1); // AND gate with in1 and A0andnA1

    // Input 10
    wire nA0;
    wire nA0andA1;
    wire I2out;
    `NOT A0inv(nA0, address0); // produce not A0 from A0
    `AND andnA0A1(nA0andA1, nA0, address1); // AND gate produces nA0andA1 from nA0 and A1
    `AND andAI2(I2out, in2, nA0andA1); // AND gate with in2 and nA0andA1;

    // Input 11
    wire A0andA1;
    wire I3out;
    `AND andA0A1(A0andA1, address0, address1); // AND gate produces A0andA1 from A0 and A1
    `AND andAI3(I3out, in3, A0andA1); // AND gate with enable and A0andA1

    // OR it all together
    `OR oreverything(out, I0out, I1out, I2out, I3out);

endmodule
