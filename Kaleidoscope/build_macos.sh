#!/usr/bin/env sh

# for macos 10.14 && ubuntu 18.04

export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

clang++ -g -O3 k.cpp `llvm-config --cxxflags --ldflags --libs all` -lm -lz -lcurses -lxml2 -o k