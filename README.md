# LLVM 学习记录

## 一、开发环境搭建

### 1.1 Ubuntu 开发环境搭建

- 系统：Ubuntu 18.04

- 方式：使用源码编译

#### 1.2 获取 LLVM 源码

```sh
git clone https://github.com/llvm/llvm-project.git
```

#### 1.3 配置及构建

```sh
cd llvm-project

mkdir build

cd build

cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi" -DCMAKE_BUILD_TYPE=Release ../llvm

cmake --build . -j8
```

#### 1.4 添加环境变量

将下面内容添加到`~/.bashrc`或`~/.zshrc`等配置中

```sh
export PATH="$PATH:xxx/llvm-project/build/bin"
```

## 二、参考资料

- [LLVM IR入门指南](https://zhuanlan.zhihu.com/c_1267851596689457152)

- [LLVM Tutorial: Table of Contents](https://llvm.org/docs/tutorial/index.html)

    中文译版：[用LLVM开发新语言](https://llvm-tutorial-cn.readthedocs.io/en/latest/)
