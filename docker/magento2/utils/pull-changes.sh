#!/usr/bin/env bash

# TODO Set correct user instead correct path to magento2 directory [andrii]
chown andrii:andrii /var/www/magento2/app/code
chown andrii:andrii /var/www/magento2/app/design/frontend
chown andrii:andrii /var/www/magento2/nginx_conf.conf
chown andrii:andrii /var/www/magento2/pub/media

# TODO Set correct path to magento2 directory
cd /home/[correct_path]/magento2

git checkout .

git pull

docker exec -it mg2-local bash -c "/usr/local/bin/composer require magento/module-elasticsearch-8 --with-all-dependencies"

chown -R www-data:www-data /var/www/magento2

docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento module:enable Magento_InventoryElasticsearch Magento_Elasticsearch8 Magento_Elasticsearch"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento config:set catalog/search/engine $SEARCH_ENGINE"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_password	$ELASTICSEARCH_PASSWORD"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_username	$ELASTICSEARCH_USERNAME"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_enable_auth	$ELASTICSEARCH_ENABLE_AUTH"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_index_prefix	$ELASTICSEARCH_INDEX_PREFIX"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_server_port	$ELASTICSEARCH_PORT"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento config:set catalog/search/elasticsearch8_server_hostname $ELASTICSEARCH_SERVER_HOSTNAME"


find var generated vendor /var/www/magento2/pub/static /var/www/magento2/pub/media /var/www/magento2/app/etc -type f -exec chmod g+w {} +
find var generated vendor /var/www/magento2/pub/static /var/www/magento2/pub/media /var/www/magento2/app/etc -type d -exec chmod g+ws {} +
chown -R :www-data .
chmod u+x /var/www/magento2/bin/magento


docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento set:up"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento indexer:reset"
docker exec -it mg2-local bash -c "php /var/www/magento2/bin/magento indexer:reindex"
# Repeat compile operation in case if first one got error.
# Temporary solution for ensuring that setup:di:compile works fine (known issue of Magento2)
docker exec -it mg2-local bash -c "php /var/www/app/bin/magento setup:di:compile"
docker exec -it mg2-local bash -c "php /var/www/app/bin/magento setup:di:compile"
#############################################################################################
docker exec -it mg2-local bash -c "php /var/www/app/bin/magento setup:static-content:deploy -f"
docker exec -it mg2-local bash -c "bin/magento config:set twofactorauth/general/enable 0"

docker restart mg2-local

docker exec -it mg2-local bash -c "service cron stop"
docker exec -it mg2-local bash -c "service cron start"
