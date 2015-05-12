#! /bin/bash
###############################################################################
## script d'automatisation ajouter vhosts
## 06/05/2015
## DYPE (nonex)
###############################################################################

# Variables
projet=$1
documentRoot="/var/www/$projet"
dypeFQDN=".dype.itinet.fr"
dypeMail="mail.itinet.fr"
dypeCloud=".cloud.itinet.fr"
serverName=$projet$dypeFQDN
sitesAvailable="/etc/apache2/sites-available/"
sitesEnabled="/etc/apache2/sites-enabled/"


# Creation du repertoire
mkdir $documentRoot
# repertoire appartient à www-data
chown -R www-data:www-data $documentRoot
# Donner les droits
chmod -R 755 $documentRoot
# Copier index.html de base

# créer le fichier dans sites-available
echo "<VirtualHost *>
ServerName $serverName
DocumentRoot $documentRoot
CustomLog /var/log/$serverName-access.log combined
ErrorLog /var/log/$serverName-error.log
</VirtualHost>" | sudo tee -a $sitesAvailable$projet.conf >/dev/null

# Activation du vhost
sudo ln -s $sitesAvailable$projet.conf $sitesEnabled

# Recharger apache 
sudo service apache2 restart

