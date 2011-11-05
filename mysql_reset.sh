#!/bin/bash
/etc/init.d/mysql stop
mysqld_safe --skip-grant-tables &
sleep 1
mysql -e 'use mysql; update user set password=PASSWORD("nova") where User="root"; flush privileges;'
/etc/init.d/mysql stop
killall mysqld
killall mysqld_safe
/etc/init.d/mysql start
