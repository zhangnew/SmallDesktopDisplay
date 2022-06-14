#!/usr/bin/env bash

set -e

pde_path=$PWD/../.pio/libdeps/esp12e/TFT_eSPI/Tools/Create_Smooth_Font/Create_font/
pde_file=$pde_path/Create_font.pde
vlw_file=$pde_path/FontFiles/SourceHanSansHWSC-Regular20.vlw
font_file=../src/font/SourceHanSans_20.h
if [ ! -f "./bin2hex" ]; then
  gcc bin2hex.c -o bin2hex
fi
python get_dict.py > dict.txt
python get_unicode.py | xargs -I '{}' sed -r -i "s/(  ).*(\/\/ Commonly.*)/\1{} \2/g" $pde_file
rm -rf dict.txt
sed -i 's/Final-Frontier/SourceHanSansHWSC-Regular/g' $pde_file
sed -i 's/".ttf"/".otf"/g' $pde_file
sed -i 's/  Desktop/\/\/ Desktop/g' $pde_file # 不弹出文件管理器
# 这里会弹出字体渲染窗口,手动关闭之后继续执行
processing-java --sketch=$pde_path --run
./bin2hex --i $vlw_file --o font.h
echo -e "#include <pgmspace.h>\nconst uint8_t SourceHanSans_20[] PROGMEM = {" > $font_file 
cat font.h | sed -r "s/^(.*)/    \1/g" >> $font_file
echo "};" >> $font_file
rm -rf font.h
echo "all done"
