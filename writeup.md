# HW2 Writeup

Note - I don't have files with the commands I used to run tests, so I'll include them here.

## Decoder

Run:
```bash
$ iverilog -o decoder decoder.t.v
$ ./decoder
```

Result:

![Decoder truth table](images/tt_structural_decoder.png)

Run:
```bash
$ gtkwave sdecoder.vcd
```

Result (after some dragging):

![Decoder waveform](images/structural_decoder.png)

## Multiplexer

Run:
```bash
$ iverilog -o multiplexer multiplexer.t.v
$ ./multiplexer
```

Result:

![Multiplexer truth table](images/tt_structural_multiplexer.png)

Run:
```bash
$ gtkwave smultiplexer.vcd
```

Result (after some dragging):

![Multiplexer waveform](images/structural_multiplexer.png)

## Adder

Run:
```bash
$ iverilog -o adder adder.t.v
$ ./adder
```

Result:

![Adder truth table](images/tt_structural_adder.png)

Run:
```bash
$ gtkwave sadder.vcd
```

Result (after some dragging):

![Adder waveform](images/structural_adder.png)
