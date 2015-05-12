#! /bin/bash
###############################################################################
## Script d'automatisation : quota user
## 10/05/2015
## DYPE (nonex)
###############################################################################

# Variables
dype="dype"
user=$1

# Copier les quotas utilisateurs de nonex
edquota -p $dype $user

# Afficher les limites de stockage
quota -sv $user
