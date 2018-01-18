## 预编译

```
gcc -E hello.c -o hello.i
```

- 展开所有的宏定义

## 编译
```
gcc -S hello.i -o hello.s
```

## 汇编

```
as hello.s -o hello.o
gcc -c hello.c -o hello.o
```

## 链接
确定全局变量, 函数的地址.
地址和空间分配, 符号决议(绑定), 重定位.
