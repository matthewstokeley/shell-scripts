#!/bin/bash



mkdir $1 $2
cd $1/$2
git init --bare
cd hooks && touch post-receive