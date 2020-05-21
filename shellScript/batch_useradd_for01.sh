#!/bin/bash
# 批量添加用户脚本
# for循环按行读取脚本
COUNT=0
for LINES in `cat addusers.txt`
do
    echo $LINES
    let COUNT += 1
done
echo
echo "$0 looped $COUNT times"