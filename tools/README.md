# 开发工具包

## 构建字库

参考这里 https://chowdera.com/2021/09/20210918113606411C.html 写了个一键更新脚本

### 准备工作

- 安装 gcc
- 安装 processing 程序，打开程序，工具 -> 安装 'processing-java',对所有人安装选否,会在 $HOME 下出现一个 `processing-java` 的可执行文件,可以放到任意 $PATH 目录下
- 从[LocationList](https://github.com/qwd/LocationList)下载[China-City-List-latest.csv](https://raw.githubusercontent.com/qwd/LocationList/master/China-City-List-latest.csv)文件到当前目录
- 在[思源黑体仓库](https://github.com/adobe-fonts/source-han-sans)自行下载最新 [release 字体文件: Language Specific HW OTFs Simplified Chinese (简体中文)](https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansHWSC.zip)，解压后把 `SourceHanSansHWSC-Regular.otf` 放到 `.pio/libdeps/esp12e/TFT_eSPI/Tools/Create_Smooth_Font/Create_font/data/` 目录下

使用其他字体也可以，只需要下载对应的 `.otf` 或 `.ttf` 文件放到上面的目录下，同时修改 `update_font.sh` 开头的 `font` 和 `font_type` 即可

### 编译字体文件

执行 `bash update_font.sh` 中间会弹出字体渲染窗口, 手动关闭之后会继续执行, 脚本执行成功后会自动更新 `/src/font/CustomFont.h` 文件，重新编译固件即可

如果有缺失字体，修改 [tools/get_dict.py](get_dict.py) 里面的 `additional_list` 变量即可
