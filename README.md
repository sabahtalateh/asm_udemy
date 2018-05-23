# asm_udemy

To assemble programs from `yasm_linux` directory install `yasm` assembler

`apt update && apt install gcc-multilib yasm`

Then add following to your ~/.bashrc

```
export YASM_INCLUDE='/path/to/include'

yasm_c() {
  local file_name=$1;
  local file_name_no_ext=${file_name::-4}
  yasm -f elf -I $YASM_INCLUDE $file_name && gcc "$file_name_no_ext.o" -o $file_name_no_ext -m32
  rm "$file_name_no_ext.o"
}
```

After it you can use `yasm_c file.asm` to assemble it.

Also you can use all these commands separately

`yasm -f elf -I $YASM_INCLUDE program.asm` 
and
`gcc program.o -o program -m32`




