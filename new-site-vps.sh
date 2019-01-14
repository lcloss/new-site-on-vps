#!/bin/bash
# Usage: ./new-site-on-vps <dest domain> <source domain>
# Example:  ./new-site-on-vps new-domain.com other-domain.com
# 
# Create a path for new site
sudo mkdir /var/www/$1/html

# Set path onwer
sudo chown $USER:$USER /var/www/$1/html

# Add write permission
sudo chmod +755 /var/www/$1

# Copy contents of source folder
sudo cp /var/www/$2/html/*.* /var/www/$1/html/

# Create vhost file from source
sudo cp /etc/apache2/sites-enabled/$2.conf /etc/apache2/sites-enabled/$1.conf

# Replace domain on vhost
sed -i 's/$2/$1/g' $1.conf

# Enable the site on vhost
sudo a2ensite $1
