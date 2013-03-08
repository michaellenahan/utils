#!/bin/bash
 
EXPECTED_ARGS=1
E_BADARGS=65
 
if [ $# -ne $EXPECTED_ARGS ]
then
  # echo "Usage: $0 dbname dbuser dbpass"
  echo "Usage: $0 sitename"
  exit $E_BADARGS
fi
 
bash download.sh $1
bash apache.sh $1
bash database.sh $1
bash install.sh $1
