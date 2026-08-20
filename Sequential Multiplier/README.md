# 4-Bit Sequential Multiplier

## Description

This project implements a 4-bit unsigned Sequential Multiplier
using Verilog HDL.

The design uses the shift-and-add multiplication algorithm.
The multiplication is performed over multiple clock cycles.

## Architecture

The multiplier contains:

- Multiplicand register
- Multiplier register
- Product register
- Counter
- Control logic

The circuit requires 4 clock cycles to multiply two 4-bit numbers.

## Inputs

- clk - Clock signal
- reset - Reset signal
- start - Starts multiplication
- multiplicand - 4-bit input
- multiplier - 4-bit input

## Outputs

- product - 8-bit multiplication result
- busy - Indicates multiplication is in progress
- done - Indicates multiplication is complete

## Example

3 × 5 = 15

Binary:

0011 × 0101 = 00001111

## Files

- sequential_multiplier.v
- sequential_multiplier_tb.v
- README.md

## Tools Used

- Verilog HDL
- VS Code
- Icarus Verilog
- GitHub

## Compilation

```bash
iverilog -o multiplier_sim sequential_multiplier.v sequential_multiplier_tb.v
