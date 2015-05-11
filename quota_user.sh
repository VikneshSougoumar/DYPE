#! /bin/bash
###############################################################################
## Script d'automatisation : quota user
## 10/05/2015
## DYPE (nonex)
###############################################################################

# Variables
nonex="nonex"
user=$1

# Copier les quotas utilisateurs de nonex
edquota -p $nonex $user

# Afficher les limites de stockage
quota -sv $user
