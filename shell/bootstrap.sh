#!/bin/sh

SAMBA_CONF=$( cat <<EOF
[shared]
path = /home/vagrant/development
public = yes
browseable = yes
writable = yes
force user = vagrant
map archive = false
EOF
)

cp /vagrant/puppet/files/.gitconfig /root/.

apt-get update
apt-get -q -y install build-essential
apt-get -q -y install git-core
apt-get -q -y install ruby-dev
apt-get -q -y install corkscrew
apt-get -q -y install libfontconfig
apt-get -q -y install libjpeg-dev
apt-get -q -y install samba

gem install --no-rdoc --no-ri bundler

echo "${SAMBA_CONF}" >> /etc/samba/smb.conf
