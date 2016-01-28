#!/bin/sh

# Fix permissions of files
chown www-data:www-data -R /var/www

# Enable services
service apache2 start
service mysql start

# Enable SSH - Insecure Key! - For development only
/sbin/my_init --enable-insecure-key

# Show the access log
tail -f /var/log/apache2/access.log
