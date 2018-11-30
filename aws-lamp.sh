#!bin/bash
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html

#update
sudo yum update -y

#
sudo yum install emacs

# install
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

# install http services and maria db server
sudo yum install -y httpd mariadb-server

#
sudo systemctl start httpd

#
sudo systemctl enable httpd

#
sudo systemctl is-enabled httpd

#
sudo usermod -a -G apache ec2-user

#
sudo chown -R ec2-user:apache /var/www

##sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \
find /var/www -type f -exec sudo chmod 0664 {} \;

#
sudo systemctl start mariadb

#
sudo mysql_secure_installation
