#!/bin/bash

echo Importing structure
mysql -upowerdns_user -ppowerdns -h 172.17.0.1 powerdns < tables.sql
echo Creating indexes
mysql -upowerdns_user -ppowerdns -h 172.17.0.1 powerdns < indexes.sql
echo Importing data
time for i in `ls -1 dbpart-a*`; do echo "mysql -upowerdns_user -ppowerdns -h 172.17.0.1 powerdns < $i"; done | parallel -j 20
