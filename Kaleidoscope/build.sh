#!/usr/bin/env sh

# for macos

export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

clang++ -g -O3 k.cpp `llvm-config --cxxflags --ldflags --system-libs --libs all` -o k