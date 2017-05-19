#!/bin/sh

set -e

# install packages
apt-get update

apt-get install -y \
    php5.6-gd php5.6-common php5.6-intl php5.6-mbstring php5.6-mcrypt \
    php5.6-mysql php5.6-readline php5.6-soap php5.6-xsl php5.6-bcmath

apt-get clean -y

sed -e 's/\(max_nesting_level\).*/\1=1000/' \
    -i /etc/php/5.6/mods-available/xdebug.ini

# install magerun
curl -o /usr/local/bin/magerun https://files.magerun.net/n98-magerun2-latest.phar
chmod +x /usr/local/bin/magerun
