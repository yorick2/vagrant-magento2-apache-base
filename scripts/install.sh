#!/usr/bin/env bash

# mysql root password
myVagrantMysqlPassword='root'

sudo apt-get update

# Install MySQL
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password ${myVagrantMysqlPassword}"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password ${myVagrantMysqlPassword}"
sudo apt-get install -y mysql-server-5.6

#
# Configure MySQL Remote Access
#
# MYSQLAUTH="--user=root --password=${myVagrantMysqlPassword}"
# mysql $MYSQLAUTH -e "GRANT ALL ON *.* TO root@'localhost' IDENTIFIED BY '${myVagrantMysqlPassword}' WITH GRANT OPTION;"
# mysql $MYSQLAUTH -e "CREATE USER 'magento'@'localhost' IDENTIFIED BY '${myVagrantMysqlPassword}';"
# mysql $MYSQLAUTH -e "GRANT ALL ON *.* TO 'magento'@'localhost' IDENTIFIED BY '${myVagrantMysqlPassword}' WITH GRANT OPTION;"
# mysql $MYSQLAUTH -e "GRANT ALL ON *.* TO 'magento'@'%' IDENTIFIED BY '${myVagrantMysqlPassword}' WITH GRANT OPTION;"
# mysql $MYSQLAUTH -e "FLUSH PRIVILEGES;"
# mysql $MYSQLAUTH -e "CREATE DATABASE magento;"

# Install Apache and PHP
sudo apt-get -y update
sudo add-apt-repository ppa:ondrej/php
sudo apt-get -y update
sudo apt-get -y install php5.6 php5.6-mcrypt php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl php5.6-zip git

# Install Composer.
cd /tmp
curl -sS https://getcomposer.org/installer | php
sudo cp composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

# Environment variables from /etc/apache2/apache2.conf
#export APACHE_RUN_USER=www-data
#export APACHE_RUN_GROUP=www-data
#export APACHE_RUN_DIR=/var/run/apache2
#export APACHE_LOG_DIR=/var/log/apache2
#export APACHE_LOCK_DIR=/var/lock/apache2
#export APACHE_PID_FILE=/var/run/apache2/apache2.pid


# Enable Apache rewrite module
sudo a2enmod rewrite

# Remove default Apache config - we supply our own for Magento.
sudo rm -f /etc/apache2/sites-enabled/000-default.conf
#sudo a2dissite 000-default

# Add the Apache virtual host file
sudo ln -fs /vagrant/config/apache-httpd-vhosts.conf /etc/apache2/sites-enabled/apache-httpd-vhosts.conf

# XDEBUG 
# wget https://xdebug.org/files/xdebug-2.5.5.tgz tar -xvzf xdebug-2.5.5.tgz cd xdebug-2.5.5/ phpize ./configure make sudo cp modules/xdebug.so /usr/lib/php/20151012/
# reboot_webserver_helper

sudo apache2ctl restart

