#!/bin/bash
# 检测服务器存活

TIMESTAMP=`date +%Y%m%d%H%M%S`
CURRENT_HTML=/var/www/html/${TIMESTAMP}.html
CURRENT_INDEX=/var/www/html/index.html
LN=/bin/ln
RM=/bin/rm
SERVER_LIST=server_list

cat <<EOF>> $CURRENT_HTML
<html>
<head>
<title>Server Alive Monitor</title>
</head>

<body>
    <table width="50%" border="1" cellpadding="1" cellspaceing="0" align="center">
        <caption>
            <h2>Server Alive Status</h2>
        </caption>
        <tr>
            <th>Server IP</th>
            <th>Server Status</th>
        </tr>
EOF

while read SERVERS
do
# 如果ping的结果返回0则状态是OK的，同时显示字体的颜色为blue
# 如果ping的结果返回状态非0则状态为FALSE的，同时显示字体颜色为red
ping $SERVER -c 3
if [ $? -eq 0 ]; then
    STATUS=OK
    COLOR=blue
else
    STATUS=FALSE
    COLOR=red
fi
echo "<tr><td>$SERVERS</td><td><font color=$COLOR>$STATUS</font></td></tr>">>
$CURRENT_HTML
done < $SERVER_LIST

cat <<EOF>> $CURRENT_HTML
</table>
</body>
</html>
EOF

# 将web根目录的主文件连接到新生成的页面
$LN -sf $CURRENT_HTML $CURRENT_INDEX