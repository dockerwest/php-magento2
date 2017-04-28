#!/bin/sh

set -e

# install packages
apt-get update

apt-get install -y \
    php7.0-gd php7.0-common php7.0-intl php7.0-mbstring php7.0-mcrypt \
    php7.0-mysql php7.0-readline php7.0-soap php7.0-xsl

apt-get clean -y

sed -e 's/\(max_nesting_level\).*/\1=1000/' \
    -i /etc/php/7.0/mods-available/xdebug.ini

# install magerun
curl -o /usr/local/bin/magerun https://files.magerun.net/n98-magerun2-latest.phar
chmod +x /usr/local/bin/magerun
