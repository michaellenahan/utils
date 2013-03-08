#!/bin/bash
 
EXPECTED_ARGS=1
E_BADARGS=65

# SITENAME
SITENAME=$1

# USER - limit to 16 characters
USER=${1:0:16}

# DB - replace hyphen with underscore.
DB=${1/-/_}
 
if [ $# -ne $EXPECTED_ARGS ]
then
  # echo "Usage: $0 dbname dbuser dbpass"
  echo "Usage: $0 sitename"
  exit $E_BADARGS
fi

cd /workspace/$SITENAME
 
drush site-install standard --yes --db-url=mysql://$USER:$USER@localhost/$DB --site-name=$SITENAME --account-pass=admin

cd /workspace/$SITENAME/sites/all/modules/
sudo mkdir contrib
sudo mkdir custom
sudo mkdir features
cd
sudo bash utils/fix-permissions.sh /workspace/$SITENAME/ michael

cd /workspace/$SITENAME/

drush dis overlay --yes
drush dis toolbar --yes
drush dl admin_menu
drush en admin_menu --yes
drush en admin_menu_toolbar --yes
drush dl module_filter

