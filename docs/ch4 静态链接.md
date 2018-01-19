## 空间与地址分配

1. 按序叠加: 多个零散的段, 内存碎片
2. 相似段合并: 两步链接
  1. 空间与地址分配
  2. 符号解析与重定位 `ld a.o b.o -e main -o ab`
    1. `-e` 修改程序入口, ld 默认入口为 `_start`

`VMA (Virtual Memory Address), LMA (Load Memory Address)`: 在嵌入式系统中不一样 (.data: LMA at rom, VMA at ram).

## ld 脚本

```
ld -T link.script
```

ld 脚本由一系列语句组成, 语句分两种, 一种是命令语句, 一种是赋值语句.