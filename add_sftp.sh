#! /bin/bash
###############################################################################
# Script d'automatisation : Ajouter un compte home + SFTP
# 10/05/2015
# DYPE (nonex)
###############################################################################

# paramètres de compte
echo "Quel est le nom d'uilisateur ?"
read user

echo "quel est votre mot de passe ?"
read -s pass
password=`mkpasswd $pass`

# création compte

sudo useradd -d /home/$user -p $password -s /bin/MySecureShell $user 
echo "Le compte a été créé avec succes !"

# ARborescence et pemissions
sudo mkdir /home/$user
sudo chmod -R 750 /home/$user
sudo chown -R www-data:www-data /home/$user

# Quotas fixes
setquota -u $user 512000 512000 0 0 /home/$user
setquota -u $user 2048000 2048000 0 0 /var/mail/$user

quota -sv $user
