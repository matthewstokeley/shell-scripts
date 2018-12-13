##!/bin/bash
# mkdir .git && cd .git
# git init --bare and place this file in .git/hooks/post-receive
# chmod +x post-receive
#https://medium.com/@francoisromain/vps-deploy-with-git-fea605f1303b
TARGET="/var/www/html/$1"
TEMP="/var/tmp/$1"
REPO="/var/www/html/$1.git"
mkdir -p $TEMP
git --work-tree=$TEMP --git-dir=$REPO checkout -f
cd $TEMP
#npm and other installation efforts here
cd /
rm -rf $TARGET
mv $TEMP $TARGET