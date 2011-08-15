#!/bin/bash

# FIND/REPLACE THESE VARIABLES:

# examples
# drupal-7.7

cd /var/www/
sudo drush dl drupal-7.7
sudo mv drupal-7.7 examples
#drush dl --destination=examples
mysql <<< 'CREATE DATABASE examples_drupal;'
mysql <<< 'GRANT ALL PRIVILEGES ON `examples\_%`.* TO examples@localhost IDENTIFIED BY "examples";'
cd /etc/apache2/sites-available/
sudo cp template examples
sudo sed -i 's/template/examples/g' examples
sudo a2ensite examples
sudo /etc/init.d/apache2 reload
cd
sudo bash /home/michael/utils/fix-permissions.sh /var/www/examples/ michael 
cd /var/www/examples/
sudo drush site-install --yes --verbose --debug --db-url=mysql://examples:examples@localhost/examples_drupal --site-name=examples
cd
sudo bash /home/michael/utils/fix-permissions.sh /var/www/examples/ michael 
sudo bash -c " echo '127.0.0.1 examples.local' >> /etc/hosts"
cd /var/www/examples/
drush dis overlay --yes

