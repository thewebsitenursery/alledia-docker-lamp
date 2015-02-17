#!/bin/bash
a2ensite default
a2enmod substitute rewrite
service apache2 start

mysqld_safe &
sleep 10s

mysqladmin -u root password root

sh /build/cleanup.sh
