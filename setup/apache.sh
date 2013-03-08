#!/bin/bash
 
EXPECTED_ARGS=1
E_BADARGS=65
 
REPLACE="s/template/$1/g"
HOST="127.0.0.1 $1.local"
 
if [ $# -ne $EXPECTED_ARGS ]
then
  # echo "Usage: $0 dbname dbuser dbpass"
  echo "Usage: $0 sitename"
  exit $E_BADARGS
fi
 
cd /etc/apache2/sites-available/
sudo cp template $1
sudo sed -i $REPLACE $1
sudo a2ensite $1
sudo service apache2 reload
cd
sudo bash -c " echo $HOST >> /etc/hosts"
sudo bash utils/fix-permissions.sh /workspace/$1/ michael 
cd /workspace/$1/
