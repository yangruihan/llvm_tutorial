# for macos
clang++ -g -O3 k.cpp `llvm-config --cxxflags --system-libs --libs --ldflags core mcjit native` -o k