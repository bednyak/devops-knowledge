#!/usr/bin/env bash

cd /var/www/magento2

/usr/local/bin/composer require magento/module-elasticsearch-8 --with-all-dependencies

echo "yes" | php /var/www/magento2/bin/magento setup:install \
--base-url=$BASE_URL \
--db-host=$MYSQL_DB_HOST \
--db-name=$MYSQL_DATABASE \
--db-user=$MYSQL_ROOT_USER \
--db-password=$MYSQL_ROOT_PASSWORD \
--admin-firstname=$ADMIN_FIRSTNAME \
--admin-lastname=$ADMIN_LASTNAME \
--admin-email=$ADMIN_EMAIL \
--admin-user=$ADMIN_USER \
--admin-password=$ADMIN_PASSWORD \
--language=$LANGUAGE \
--currency=$CURRENCY \
--timezone=$TIMEZONE \
--use-rewrites=1 \
--backend-frontname=adminpanel \
--cleanup-database \
--disable-modules=Magento_InventoryElasticsearch,Magento_Elasticsearch8,Magento_Elasticsearch,Magento_OpenSearch

chown -R www-data:www-data /var/spool/cron
chown -R www-data:www-data /var/www/magento2

php /var/www/magento2/bin/magento module:enable Magento_InventoryElasticsearch Magento_Elasticsearch8 Magento_Elasticsearch
php /var/www/magento2/bin/magento config:set catalog/search/engine $SEARCH_ENGINE
php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_password	$ELASTICSEARCH_PASSWORD
php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_username	$ELASTICSEARCH_USERNAME
php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_enable_auth	$ELASTICSEARCH_ENABLE_AUTH
php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_index_prefix	$ELASTICSEARCH_INDEX_PREFIX
php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_server_port	$ELASTICSEARCH_PORT
php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_server_hostname $ELASTICSEARCH_SERVER_HOSTNAME
php /var/www/magento2/bin/magento cron:install
php /var/www/magento2/bin/magento set:up
php /var/www/magento2/bin/magento indexer:reset
php /var/www/magento2/bin/magento indexer:reindex

find var generated vendor /var/www/magento2/pub/static /var/www/magento2/pub/media /var/www/magento2/app/etc -type f -exec chmod g+w {} +
find var generated vendor /var/www/magento2/pub/static /var/www/magento2/pub/media /var/www/magento2/app/etc -type d -exec chmod g+ws {} +
chown -R :www-data .
chmod u+x /var/www/magento2/bin/magento

php /var/www/magento2/bin/magento module:disable Magento_AdminAdobeImsTwoFactorAuth
php /var/www/magento2/bin/magento module:disable Magento_TwoFactorAuth
php /var/www/magento2/bin/magento deploy:mode:set default
php /var/www/magento2/bin/magento set:up
php -d memory_limit=-1 /var/www/magento2/bin/magento setup:static-content:deploy -f

service cron stop
service cron start
