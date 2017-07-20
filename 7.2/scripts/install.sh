#!/bin/sh

set -e

# install packages
apt-get update

apt-get install -y \
    php7.2-gd php7.2-common php7.2-intl php7.2-mbstring php7.2-mysql \
    php7.2-readline php7.2-soap php7.2-xsl php7.2-bcmath

apt-get clean -y

# magento needs a bit more memory than 256M
sed -e 's/^\(memory_limit\).*/\1 = 1024M/' \
    -i /etc/php/7.2/mods-available/custom.ini

sed -e 's/\(max_nesting_level\).*/\1=1000/' \
    -i /etc/php/7.2/mods-available/xdebug.ini

# install magerun
curl -o /usr/local/bin/magerun https://files.magerun.net/n98-magerun2-latest.phar
chmod +x /usr/local/bin/magerun
