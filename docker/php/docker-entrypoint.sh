#!/bin/sh
set -e

# Configure database settings
echo "<?php" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_noedit = 2;" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_main_data_root='/var/lib/dolibarr';" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_database='$APP_DATABASE_NAME';" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_type='mysqli';" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_dbserver='$APP_DATABASE_HOST';" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_port=${APP_DATABASE_PORT:-3306};" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_createdatabase=false;" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_databaselogin='$APP_DATABASE_USER';" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_databasepass='$APP_DATABASE_PASS';" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_createuser=false;" >>/var/www/html/htdocs/install/install.forced.php
echo "\$force_install_dolibarrlogin='admin';" >>/var/www/html/htdocs/install/install.forced.php

# Delegate to classic entrypoint
/usr/local/bin/docker-php-entrypoint

exec "$@"
