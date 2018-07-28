# Quick and dirty Vagrant image using vagrant for multiple sites. The php version can be switched easily. 

apache config folder location: config/apache-httpd-vhosts.conf

## bash functions:-
switchToPhp5.6
switchToPhp7.0
switchToPhp7.1

## scripts:-
install.sh - sets up vagrant
run.sh - useful after restarting your pc, because apache and mysql are stopped
bash-functions.sh - adds bash functions

## symlinked folders:-
extenernal location > location in vagrant
../sites > /var/www    links a web folder
mysqlBackup/ > /var/lib/mysql/   keeps the mysql databases

ip: 33.33.33.33

web port:80  - this may need to be changed on some systems that already have port 80 taken

## mysql connection:-
port: 8306
user: root
password: root