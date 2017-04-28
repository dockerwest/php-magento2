#!/bin/sh

set -e

# install packages
apt-get update

apt-get install -y \
    php7.1-gd php7.1-common php7.1-intl php7.1-mbstring php7.1-mcrypt \
    php7.1-mysql php7.1-readline php7.1-soap php7.1-xsl

apt-get clean -y

sed -e 's/\(max_nesting_level\).*/\1=1000/' \
    -i /etc/php/7.1/mods-available/xdebug.ini

# install magerun
curl -o /usr/local/bin/magerun https://files.magerun.net/n98-magerun2-latest.phar
chmod +x /usr/local/bin/magerun
