#!/bin/bash



if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[33mPlease run this script as root user\033[0m"
    exit
fi

wait

echo -e "\e[32m
 __  __  ___  _                                         _                     _      
|  \/  |/ _ \| |__   __ _ _ __ ___  _ __ ___   __ _  __| |_ __ ___ ______ _  (_)_ __ 
| |\/| | | | | '_ \ / _` | '_ ` _ \| '_ ` _ \ / _` |/ _` | '__/ _ \_  / _` | | | '__|
| |  | | |_| | | | | (_| | | | | | | | | | | | (_| | (_| | | |  __// / (_| |_| | |   
|_|  |_|\___/|_| |_|\__,_|_| |_| |_|_| |_| |_|\__,_|\__,_|_|  \___/___\__,_(_)_|_|                                                          
\033[0m"
echo -e "    \e[31mProgrammer: \e[34m@Mohammadreza Kakesh\033[0m | \e[31mTelegram Group: \e[34m@wizwizdev\033[0m\n"

#sleep
echo -e "\e[32mInstalling Wordpress ... \033[0m\n"
sleep 5

sudo apt update && apt upgrade -y
echo -e "\e[92mYour server successfully updated...\033[0m\n"


#!1. Install Apache
sudo apt install apache2 -y
echo -e "\e[92mApache successfully Installed...\033[0m\n"
sleep 5

#!2. Install PHP
sudo apt install php libapache2-mod-php php-mysql -y
echo -e "\e[92mPHP successfully Installed...\033[0m\n"
sleep 5

#!3. Install Database
sudo apt install mysql-server -y
sudo mysql_secure_installation
sudo mysql -u root -p
CREATE DATABASE wpdb DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON wpdb.* TO 'wpuser'@'localhost';
echo -e "\e[92mMysql successfully Installed...\033[0m\n"
sleep 5

#!4. WordPress
cd /var/www/html
sudo rm *
sudo wget http://wordpress.org/latest.tar.gz
sudo tar xzf latest.tar.gz
sudo mv wordpress/* .
sudo chown -R www-data: .
echo -e "\e[92mWordPress successfully Installed...\033[0m\n"
