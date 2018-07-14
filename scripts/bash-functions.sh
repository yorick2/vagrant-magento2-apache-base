#!/bin/sh

function switchToPhp5.6(){
 sudo a2dismod php7.1
 sudo a2dismod php7.0
 sudo a2enmod php5.6
 sudo service apache2 restart
 # update php cli
 sudo rm /etc/alternatives/php
 sudo ln -s /usr/bin/php5.6 /etc/alternatives/php
}

function switchToPhp7.0(){
 sudo a2dismod php7.1
 sudo a2dismod php5.6
 sudo a2enmod php7.0
 sudo service apache2 restart
 # update php cli
 sudo rm /etc/alternatives/php
 sudo ln -s /usr/bin/php7.0 /etc/alternatives/php
}

function switchToPhp7.1(){
 sudo a2dismod php7.0
 sudo a2dismod php5.6
 sudo a2enmod php7.1
 sudo service apache2 restart
 # update php cli
 sudo rm /etc/alternatives/php
 sudo ln -s /usr/bin/php7.1 /etc/alternatives/php
}
