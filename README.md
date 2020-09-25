# LLVM 学习记录

## 一、开发环境搭建

### 1.1 Ubuntu 开发环境搭建

- 系统：Ubuntu 18.04

- 方式：使用源码编译

#### 1.1.1 安装 CMake

```sh
sudo apt install cmake
```

#### 1.1.2 获取 LLVM 源码

```sh
git clone https://github.com/llvm/llvm-project.git
```

#### 1.1.3 配置及构建

```sh
cd llvm-project

mkdir build

cd build

cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi" -DCMAKE_BUILD_TYPE=Release ../llvm

cmake --build . -j8
```

#### 1.1.4 添加环境变量

将下面内容添加到`~/.bashrc`或`~/.zshrc`等配置中

```sh
export PATH="$PATH:xxx/llvm-project/build/bin"
```

### 2.1 macOS 开发环境搭建

- 系统：macOS 10.14.6

- 方式：使用`brew`安装

#### 2.1.1 使用`brew`进行安装

```sh
brew install --build-from-source llvm
```

#### 2.1.2 配置环境变量

```sh
export PATH="/usr/local/opt/llvm/bin:$PATH"
```

### 3.1 Windows 开发环境搭建

- 系统： Windows 10

- 方式： 使用源码编译

- Visual Studio 2019

#### 3.1.1 安装 CMake

从[官网](https://cmake.org/download/)下载最新版本的 CMake

安装完毕后将`cmake.exe`所在的目录添加到环境变量

#### 3.1.2 获取 LLVM 源码

```sh
git clone https://github.com/llvm/llvm-project.git
```

#### 3.1.3 配置及构建

```sh
cd llvm-project

mkdir build

cd build

cmake -G "Visual Studio 16 2019" -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi" ../llvm
```

在`build`文件夹中找到对应的`sln`，打开之后选择 64 位 Release 版本进行编译

#### 3.1.4 添加环境变量

将构建出来的`bin`目录添加到环境变量中

## 二、参考资料

- [LLVM IR入门指南](https://zhuanlan.zhihu.com/c_1267851596689457152)

- [LLVM Tutorial: Table of Contents](https://llvm.org/docs/tutorial/index.html)

    中文译版：[用LLVM开发新语言](https://llvm-tutorial-cn.readthedocs.io/en/latest/)
