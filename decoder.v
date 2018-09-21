// Decoder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define NOR nor #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);

    // Address 00
    wire A0norA1;
    `NOR norA0A1(A0norA1, address0, address1); // NOR gate produces A0norA1 from A0 and A1
    `AND andE00(out0, enable, A0norA1); // AND gate with enable and norA0A1

    // Address 01
    wire nA1;
    wire A0andnA1;
    `NOT A1inv(nA1, address1); // produce not A1 from A1
    `AND andA0nA1(A0andnA1, address0, nA1); // AND gate produces A0andnA1 from A0 and nA1
    `AND andE01(out1, enable, A0andnA1); // AND gate with enable and A0andnA1

    // Address 10
    wire nA0;
    wire nA0andA1;
    `NOT A0inv(nA0, address0); // produce not A0 from A0
    `AND andnA0A1(nA0andA1, nA0, address1); // AND gate produces nA0andA1 from nA0 and A1
    `AND andE10(out2, enable, nA0andA1); // AND gate with enable and nA0andA1;

    // Address 11
    wire A0andA1;
    `AND andA0A1(A0andA1, address0, address1); // AND gate produces A0andA1 from A0 and A1
    `AND andE11(out3, enable, A0andA1); // AND gate with enable and A0andA1
endmodule
