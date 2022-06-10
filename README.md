# SmallDesktopDisplay

## Description

相比原版，做了如下改动：

- [x] [修复太空人代码报错](https://github.com/zhangnew/SmallDesktopDisplay/commit/f00e219d092e58ba779a4b3be955c99dc6b7c01b)
- [x] [修复天气不更新的问题](https://github.com/zhangnew/SmallDesktopDisplay/commit/177a9887b00bb58bfab121f21ce5c5e36c6609c5)
- [x] [修复 NTP 时间更新机制(原版会在 WiFi 休眠时更新失败)](https://github.com/zhangnew/SmallDesktopDisplay/commit/adaa7b4f02e187a7ad8397c01106c354f03120c5)
- [x] [串口日志输出添加时间戳](https://github.com/zhangnew/SmallDesktopDisplay/commit/f2d5da7f837646306de75ab2dbe478775198b21b)
- [ ] 修复串口命令失效的问题

## Development

```bash
brew install platformio
# build
pio run -e esp12e
# build and upload
pio run -e esp12e -t upload
```
