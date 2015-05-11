#! /bin/bash
###############################################################################
## script d'automatisation supprimer vhosts
## 10/05/2015
## DYPE (nonex)
###############################################################################

# Variables
projet=$1
documentRoot="/var/www/dype/$projet"
sitesAvailable="/etc/apache2/sites-available/"
sitesEnabled="/etc/apache2/sites-enabled/"


# Suppression du repertoire
sudo rm -R $documentRoot

# supprimer le fichier dans sites-available
sudo rm $sitesAvailable$projet.conf 
sudo rm $sitesEnabled$projet.conf

# Recharger apache 
sudo service apache2 restart

