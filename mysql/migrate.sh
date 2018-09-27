#!/bin/bash
mysql -uroot -p$MYSQL_ROOT_PASSWORD <<-CMD
drop database if exists cogn;
create database cogn;
use cogn;
source /data/seed.sql;
CMD

mysql -uroot -p$MYSQL_ROOT_PASSWORD <<-CMD
drop database if exists cogn_test;
create database cogn_test;
use cogn_test;
source /data/seed.sql;
CMD
