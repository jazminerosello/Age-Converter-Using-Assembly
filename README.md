# Age-Converter-Using-Assembly

**Author**: Ma. Jazmine P. Rosello

**Purpose**: For completion of exercise in CMSC 131: Introduction to Computer Organization and Machine Level

## Program Description

An assembly program that converts the value of age in years (0-100) to its equivalent days and hours.

## To run: (With the use of gdb)

file a.out

set disassembly-flavor intel

b*exit_here

r

x/ub &age

x/uw &days

x/ug &hours
