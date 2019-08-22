#!/bin/bash

apt-get install apache2 -y

ufw allow 80/tcp

echo "name of a website"
read website

echo " make inside it html "
mkdir -p /var/www/html/$website

echo " <html><body><h1>.......hey i m deepak.......</h1></body></html> " > /var/www/html/$website/index.html

chown -Rf www-data /var/www/html/$website

chmod -Rf 775 /var/www/html/$website

echo " <VirtualHost *:80>
            ServerAdmin $website
            ServerName www.$website
            DirectoryIndex index.html
            DocumentRoot /var/www/html/$website
      </VirtualHost> " > /etc/apache2/sites-available/$website.conf

path=/etc/apache2/apache2.conf

sed -i ' 175 a\
         <Directory /var/www/html/server.com\
          Options Indexes MultiViews FollowSymLinks\
          DirectoryIndex index.php index.html\
          AllowOverride all\
          Allow From all\
         </Directory>\ ' $path

sed -i 's/server.com/'$website/g $path

a2ensite $website
apache2ctl configtest
systemctl restart apache2

apt-get install mysql-server -y

ufw allow 3306/tcp

echo ""
systemctl start mysql

echo ""
systemctl enable mysql

echo ""
mysql_secure_installation

echo "add user"
read user

echo "enter password"
read password

echo "create database"
read database

echo " entry in mysql "

mysql <<-ENDMARKER

create user '$user'@'localhost' identified by '$password';
create database $database;
GRANT ALL PRIVILEGES  ON *.* TO '$user'@'localhost';
FLUSH PRIVILEGES;

ENDMARKER

apt-get install php -y

echo ""
apt-get install phpmyadmin

systemctl restart apache2




































