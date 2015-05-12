#! /bin/bash
###############################################################################
## script d'automatisation supprimer vhosts
## 10/05/2015
## DYPE (nonex)
###############################################################################

# Variables
projet=$1
sitesEnabled="/etc/apache2/sites-enabled/"

# supprimer le fichier dans sites-enabled
sudo rm $sitesEnabled$projet.conf

# Recharger apache 
sudo service apache2 restart

