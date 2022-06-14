#!/usr/bin/env python
# encoding: utf-8

char_list = set()

with open("dict.txt") as f:
    while True:
        lines = f.readlines(1024 * 1024)
        if not lines:
            break
        for line in lines:
            for c in line:
                char_list.add(c)

def hex_to_char(unicode):
    return unicode.replace("0x", "\\u").encode("utf-8").decode("unicode_escape")

def char_to_hex(char):
    return char.encode("unicode_escape").decode("utf-8").replace("\\u", "0x")

def is_hans_char(char):
    return len(char.encode("unicode_escape")) > 4

chinese_list = [char_to_hex(x) for x in char_list if is_hans_char(x)];
# for char in chinese_list:
#     print(hex_to_char(char) + " " + char)
print("字符数量=" + str(len(chinese_list)))
print(", ".join(chinese_list))