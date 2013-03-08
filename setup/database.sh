#!/bin/bash
#http://jetpackweb.com/blog/2009/07/20/bash-script-to-create-mysql-database-and-user/
 
EXPECTED_ARGS=1
E_BADARGS=65
MYSQL=`which mysql`

# USER - limit to 16 characters
USER=${1:0:16}

# DB - replace all hyphens with underscores.
DB=${1//-/_}
 
Q1="CREATE DATABASE IF NOT EXISTS $DB;"
Q2="CREATE USER '$USER'@'localhost' IDENTIFIED BY '$USER';"
Q3="GRANT ALL ON $DB.* TO '$USER'@'localhost';"
Q4="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}${Q4}"
 
if [ $# -ne $EXPECTED_ARGS ]
then
  # echo "Usage: $0 dbname dbuser dbpass"
  echo "Usage: $0 sitename"
  exit $E_BADARGS
fi
 
# mysql user and password stored in ~/.my.cnf
$MYSQL -e "$SQL"

echo "site ="
echo $1
echo "database ="
echo $DB
echo "user ="
echo $USER
echo "password ="
echo $USER
