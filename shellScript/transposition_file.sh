#!/bi/bash
# 给定一个文件file.txt，转置它的内容
# name age
# alice 21
# ryan 30

# output
# name alice ryan
# age 21 30

k = `awk '{print NF}' file.txt | head -1`
for ((i=1;i<=k;i++))
do
    awk '{print $'$i'}' file.txt | xargs
done