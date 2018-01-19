/* 
入口地址设置 (靠前的优先级高)
1. ld -e
2. ENTRY(symbol)
3. _start
4. .text 第一字节
5 0
*/

/*
STARTUP(filename) // 第一个输入文件
SEARCH_DIR(path) // 将 path 加入到库查找目录
INPUT(file,file,...) // 将指定文件作为输入文件
INCLUDE filename // #include 预处理
PROVIDE(symbol) // 在脚本中定义某个符号

SECTIONS {
  secname : { contents }
}

contents 规则
filename (sections)

- file1.o(.data)
- file1.o(.data .rodata)
- file1.o // all sections in file1.o
- *(.data) // all .data sections
- [a-z]*(.text*[A-Z])
*/

ENTRY(nomain);

SECTIONS {
  . = 0x08048000 + SIZEOF_HEADERS;
  tinytext : { *(.text) *(.data) *(.rodata) }
  /DISCARD/ : { *(.comment) }
}