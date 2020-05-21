#!/bin/bash
HOSTNAME="localhost"
USERNAME="root"
PASSWORD="password"
MYSQL=/usr/bin/mysql
SH_DB="show databases"
DBNAME="test"
TABLENAME="test"
$MYSQL -u $USERNAME -p $PASSWORD -e "$SH_DB"

# create database
create_db_sql="create database ${DBNAME}"
mysql -u ${USERNAME} -p ${PASSWORD} -e "${create_db_sql}"

# create table
create_table_sql="create table ${TABLENAME} (name varchar(20), id int(10))"
mysql -u ${USERNAME} -p ${PASSWORD} -e "${create_table_sql}"

# insert data
insert_sql="insert into ${TABLENAME} values('John', 1)"
mysql -u ${USERNAME} -p ${PASSWORD} -e "${insert_sql}"

# query data
select_sql="select * from ${TABLENAME}"
mysql -u ${USERNAME} -p ${PASSWORD} -e "${select_sql}"

# update data
update_sql="update ${TABLENAME} set id = 3 where id = 1"
mysql -u ${USERNAME} -p ${PASSWORD} -e "${update_sql}"

# delete data
delete_sql="delete from ${TABLENAME} where id=3"
mysql -u ${USERNAME} -p ${PASSWORD} -e "${delete_sql}"