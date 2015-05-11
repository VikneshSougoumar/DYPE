#! /bin/bash
###############################################################################
# Script d'automatisation : Ajouter un compte SFTP
# 10/05/2015
# DYPE (nonex)
###############################################################################

# Variables
user=$1

sudo grep $user /etc/passwd | sed -i 's/bash/MySecureShell/' /etc/passwd
