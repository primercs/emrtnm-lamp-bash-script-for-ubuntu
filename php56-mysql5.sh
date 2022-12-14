#!/bin/sh
DIVIDER="\n########################################\n\n"

printf "Requirements are installing...\n"

sudo add-apt-repository ppa:ondrej/php
sudo apt-get install software-properties-common apt-transport-https -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install wget nano screen unzip curl apache2 -y
sudo ufw allow in "Apache"
sudo ufw allow in "Apache Full"

sudo mkdir /var/www
sudo mkdir /var/www/html
sudo chown -R $USER:$USER /var/www
sudo chmod -R 775 /var/www
sudo rm -rf /var/www/html/index.html
sudo echo "<?php phpinfo();" >> /var/www/html/index.php

printf $DIVIDER
printf "PHP5.6 is installing..."
printf $DIVIDER

sudo apt-get install php5.6 php5.6-gd php5.6-mysql php5.6-imap php5.6-curl php5.6-intl php5.6-pspell php5.6-recode php5.6-sqlite3 php5.6-tidy php5.6-xmlrpc php5.6-xsl php5.6-zip php5.6-mbstring php5.6-soap php5.6-opcache php5.6-json php5.6-readline php5.6-xml -y

printf $DIVIDER
printf "PHP5.6 has been installed.\n"
printf $DIVIDER

printf $DIVIDER
printf "Mysql is installing...\n"
printf $DIVIDER

sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
sudo apt-get update
sudo apt-get install mysql-client=5.7.39-1ubuntu18.04 -y
sudo apt-get install mysql-community-server=5.7.39-1ubuntu18.04 -y
sudo apt-get install mysql-server=5.7.39-1ubuntu18.04 -y

sudo systemctl restart mysql.service

printf $DIVIDER
printf "Mysql has been installed.\n"
printf $DIVIDER

sudo a2enmod rewrite
sudo systemctl start apache2