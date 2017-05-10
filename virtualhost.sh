#!/bin/bash
#apache virtual host
#usage : ./virtualhost.sh domainname
#must have apache2
#sudo apt-get install apache2

echo "Create Apache Virtual Host"
echo "Usage : chmod +x virtualhost.sh"
echo "./virtualhost.sh domainname"
echo "Enjoy !!! @gitnepal"

sudo mkdir -p /var/www/$1/
sudo chown -R $USER:$USER /var/www/$1/
sudo chmod -R 755 /var/www
echo "It works!" >> /var/www/$1/index.html
echo -e "\e[1;31m Submit the form: \e[0m"
read -p "ServerAdmin eg- admin@demo.com : " ServerAdmin
read -p "ServerAlias eg- www.demo.com : " ServerAlias
sudo chmod -R 777 /etc/apache2/sites-available/
sudo echo "<VirtualHost *:80>
    ServerAdmin $ServerAdmin
    ServerName $1
    ServerAlias $ServerAlias
    DocumentRoot /var/www/$1
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" >> /etc/apache2/sites-available/$1.conf
sudo a2ensite $1.conf
sudo service apache2 reload
sudo chmod -R 777 /etc/hosts
echo "127.0.0.1 $1" >> /etc/hosts
sudo service apache2 reload
