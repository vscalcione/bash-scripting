#!/bin/bash

PWD=${1?Error: No password given}
FILE=${2?Error: No file given}

sudo apt install ghostscript
pdftops -upw $PWD $FILE
ps2pdf $FILE
echo `PASSWORD REMOVED WITH SUCCESS ON FILE: $FILE`
