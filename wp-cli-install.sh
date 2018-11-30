#!/bin/bash

#https://wp-cli.org/

# download wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# test the phar
php wp-cli.phar --info

# change permissions
chmod +x wp-cli.phar

# move the executable to the bin
sudo mv wp-cli.phar /usr/local/bin/wp

# download wordpress
wp core download path=/var/www/html/blog