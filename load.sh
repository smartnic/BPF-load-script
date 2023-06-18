#!/bin/bash

# 1 argument: c file representing the bpf program

# Task 1: compile .c file to bpf bytecode (.o file) using clang

#collect the first argument
CFILE=$1

#stores the suffix of bytecode file
END=".o"

#stores length of c file name
LENGTH=${#CFILE}

#getting substring of .c file which does not include c at the end
FILE=${CFILE:0:LENGTH-2}

#constructing .o file name
OFILE=$FILE$END

#constructing pin path
PREFIX=/sys/fs/bpf/

#pin path
PINPATH=$PREFIX$FILE
#compiling .c file to .o file using clang
clang -O2 -emit-llvm -c $CFILE -o - | llc -march=bpf -filetype=obj -o $OFILE 

#Task 2: Loading bytecode
bpftool prog load $OFILE $PINPATH 
 
echo $CFILE
echo $LENGTH
echo $FILE
echo $OFILE
echo $PINPATH 
