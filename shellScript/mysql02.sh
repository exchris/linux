#!/bin/bash
mysql -uroot -p password << EOF
CREATE DATABASE DB01;
use DB01;
CREATE TABLE user
(
userId int(20) not null,
userName varchar(20) not null,
userPass varchar(20) not null,
age int(10) not null,
primary key(userId)
);
EOF

# pipeline or redirect
mysql -uroot -ppassword < update.sql
cat update.sql | mysql -uroot -ppassword