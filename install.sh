#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# Mon script de post installation Linux
#
# Syntax: # sudo ./install.rb
#
# Thooams (aka) Thomas
# Distributed under the GPL version 3 license
#
VERSION="1"

#=============================================================================
# Liste des applications à installer: A adapter a vos besoins
# Voir plus bas les applications necessitant un depot specifique
LISTE=""


# Ajout des liste ppa

# Install gedit-mate
sudo apt-add-repository ppa:ubuntu-on-rails/ppa


# Ajout des packages par défaut
LISTE=$LISTE" curl screen vim git git-core"

# Ajout de la liste pour l'environnement EIME
LISTE=$LISTE" ruby1.8 postgresql build-essential zlib1g-dev libssl-dev libreadline5-dev libxml2-dev libxslt1-dev libpq-dev"

#==============================================================================

if [ $EUID -ne 0 ]; then
  echo "Le script doit être lancé en root: # sudo $0" 1>&2
    exit 1
fi

ADDAPT="add-apt-repository -y"

# Ajout des dépots
UBUNTUVERSION=`lsb_release -cs`
echo "Ajout des depots pour Ubuntu $UBUNTUVERSION"

# gedit-mate
$ADDAPT ppa:ubuntu-on-rails/ppa
LISTE=$LISTE" gedit-gmate"

# Dropbox
add-apt-repository "deb http://www.getdropbox.com/static/ubuntu $UBUNTUVERSION main"
apt-key adv --keyserver pgp.mit.edu --recv-keys FC918B335044912E
LISTE=$LISTE" nautilus-dropbox xclip zenity"


# Spotify
egrep '^deb\ .*spotify' /etc/apt/sources.list > /dev/null
if [ $? -ne 0 ]
then
	echo "## 'Spotify' repository"
	echo -e "deb http://repository.spotify.com stable non-free\n" >> /etc/apt/sources.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E
fi
LISTE=$LISTE" spotify-client-qt"

#==============================================================================

# Mise à jour de la liste
echo "Mise a jour de la liste des depots"
apt-get update

echo "Mise a jour du systeme"
apt-get upgrade

# Installations additionnelles
#-----------------------------

echo "Installation des logiciels suivants: $LISTE"

apt-get install $LISTE

# Restart Nautilus
nautilus -q

# installation du script CODDE
cd ~
git clone https://github.com/thooams/setup-linux.git ~/setup
cp ~/setup/codde /usr/bin/codde
rm -rf setup

echo "========================================================================"
echo
echo "Liste des logiciels installés: $LISTE"
echo
echo "========================================================================"
echo
echo "Installation terminée"
echo
echo "========================================================================"
