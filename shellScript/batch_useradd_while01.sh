#!/bin/bash
# while循环按行读取脚本
# 批量添加用户
COUNT=0
while read LINES
do
    echo $LINES
    let COUNT += 1
done < addusers.txt

echo
echo "$0 looped $COUNT times"