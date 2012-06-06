#!/bin/bash
# -*- coding: utf-8 -*-
#
# Mon script de post installation Linux
#
# Syntax: # sudo ./eime-install.rb
#
# Thooams (aka) Thomas
# Distributed under the GPL version 3 license
#

VERSION="1"
SYSBIT= getconf LONG_BIT
LISTE=""

# Determine l'architecture 64 ou 32 bits
if [ "$SYSBIT" = "64" ]; then 
	IS_64BITS=true;
else
	IS_64BITS=false;
fi


#=============================================================================
# Liste des applications à installer pour eime:
PACKAGES="sudo apt-get install git-core ruby1.8 postgresql build-essential zlib1g-dev libssl-dev libreadline5-dev libxml2-dev libxslt1-dev libpq-dev"

# Liste complémentaire à eime
# Ajout de Dropbox
if [ "$SYSBIT" = "64" ]; then 
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
else
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -
fi

#lance le démon Dropbox
~/.dropbox-dist/dropboxd


PACKAGES=$PACKAGES" nautilus-dropbox"




# Test que le script est lance en root
if [ $EUID -ne 0 ]; then
  echo "Le script doit être lancé en root: # sudo $0" 1>&2
  exit 1
fi

ADDAPT="add-apt-repository -y"

UBUNTUVERSION=`lsb_release -cs`
echo "Ajout des depots pour Ubuntu $UBUNTUVERSION"