## 格式

可执行文件格式.
- Windows: PE
- Linux: ELF
- 都是 COFF 格式的变种

目标文件就是编译但未进行链接的中间文件 (.obj, .o).
它跟可执行文件的内容和结构相似, 所以他们用一种格式存储.

动态链接库 (.dll, .so) 和静态链接库 (.lib, .a) 同样采用可执行文件格式存储.
静态链接库是目标文件打包在一起加上索引.

ELF 可以分成: 可重定位文件, 可执行文件, 共享目标文件, 核心转储文件.
```
file hello.o
```

## 结构
机器指令, 数据, 其他信息 (符号表, 调试信息, 字符串等).
这些内容按不同属性, 以节 (Section, 或段 Segment) 的形式存储.

指令放在代码段中, 常见段名为 .code, .text,
全局和局部静态变量存放在数据段中, 一般称为 .data.
未初始化的全局和局部静态变量放在 .bss 段中, .bss 段不占用 (目标文件) 空间, 只是预留内存位置.
只读数据端 .rodata, 比如字符串常量.

这些是以 `.` 开头的段是系统保留的段, 应用程序也可以使用自定义的段.

```
__attribute__((section("FOO"))) int global = 42;
__attribute__((section("BAR"))) void foo () {
}
```

.rel.xxx 是一个重定位表

## 符号

```
nm SimpleSection.o
```

弱符号: 未初始化的全局变量和 weak 属性.
```
__attribute__ ((weak))
```

弱引用: 链接器不会报错.
```
__attribute__ ((weakref)) void foo();
```

以 debug 开始的段: 调试信息. 
```
strip foo
```