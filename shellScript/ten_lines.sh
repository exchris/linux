#!/bin/bash
# 给定一个文本文件 file.txt，请只打印这个文件中的第十行
# first way
awk 'NR==10' file.txt

# second way
sed -n '10p' file.txt

# three way
tail -n +10 file.txt | head -1