// Adder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define NOR nor #50

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);

    // Carryout
    wire aandb;
    wire bandc;
    wire aandc;
    `AND andab(aandb, a, b);
    `AND andbc(bandc, b, carryin);
    `AND andac(aandc, a, carryin);
    `OR orcarryout(carryout, aandb, bandc, aandc);

    // Sum
    wire bnorc;
    wire onlya;
    wire anorc;
    wire onlyb;
    wire anorb;
    wire onlyc;
    wire all;
    `NOR norbc(bnorc, b, carryin);
    `NOR norac(anorc, a, carryin);
    `NOR norab(anorb, a, b);
    `AND andonlya(onlya, a, bnorc);
    `AND andonlyb(onlyb, b, anorc);
    `AND andonlyc(onlyc, carryin, anorb);
    `AND andall(all, carryin, aandb);
    `OR orsum(sum, onlya, onlyb, onlyc, all);

endmodule
