# Kaleidoscope

## Env

- System：macOS 10.14.6

- LLVM
    Install with `brew install --build-from-source llvm`

    ```
    llvm: stable 10.0.1 (bottled), HEAD [keg-only]
    Next-gen compiler infrastructure
    https://llvm.org/
    /usr/local/Cellar/llvm/10.0.1_1 (7,029 files, 1GB)
    Built from source on 2020-09-20 at 03:41:37
    From: https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git/Formula/llvm.rb
    License: Apache-2.0
    ```

## Build

```sh
./build.sh
```

## Run

```sh
./k
```

## Problem & Solution

1. 连接错误：Linker Error: `ld: symbol(s) not found for architecture x86_64`

    Check build command `llvm-config` `--libs` option, you can use `llvm-config --libs all` directly. 

2. 如何结束当前输入

    - Windows: 输入快捷键`ctrl`+`Z`后再按回车

    - macOS: 输入快捷键`ctrl`+`D`
