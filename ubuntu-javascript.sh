#! /bin/bash

# set up basics

sudo apt-get update

# mongodb
#
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
#
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
#
sudo apt-get update
#
sudo apt-get install -y mongodb-org


# node
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

# install node
sudo apt-get install -y nodejs

# install node utilities
sudo apt-get install -y build-essential

#todo add phantom js build

# install global node packages
#
# grunt
sudo npm install grunt-cli -g
# nodemon
sudo npm install nodemon -g