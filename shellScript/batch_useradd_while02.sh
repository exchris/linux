#!/bin/bash
# while循环按行读取脚本
# 批量添加用户
while read LINES
do
    USERNAME=`echo $LINES | cut -f1 -d' '`
    PASSWORD=`echo $LINES | cut -f2 -d' '`
    # 测试打印截取结果
    echo -n "USERNAME:$USERNAME,PASSWOD:$PASSWORD"
    echo
done < addusers.txt