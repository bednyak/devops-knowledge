FROM php:8.2-fpm

# install common packages
RUN apt-get update \
    && apt-get install -y libpq-dev \
    libpcre3-dev \
    gnupg \
    libcurl4-openssl-dev \
    libjpeg62-turbo-dev \
    libmagickwand-dev \
    libxml2-dev \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libsodium-dev

# install php extensions.
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install zip

RUN docker-php-ext-install \
    opcache \
    ctype \
    curl

RUN docker-php-ext-install \
    dom \
    fileinfo \
    filter

RUN docker-php-ext-configure \
    gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install gd
RUN docker-php-ext-install iconv

RUN docker-php-ext-install \
    intl

RUN docker-php-ext-install \
    mbstring

RUN docker-php-ext-install \
    pdo_mysql \
    simplexml \
    soap

RUN docker-php-ext-install \
    sockets \
    sodium

RUN apt-get install -y libxslt-dev

RUN docker-php-ext-install \
    xmlwriter \
    bcmath \
    xsl

# install composer
RUN cd ~ \
    && curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# copy sources
RUN mkdir -p /var/www/magento2

COPY . /var/www/magento2
WORKDIR /var/www/magento2

#install nano
RUN apt-get install nano -y

#install crontab
RUN apt-get update && apt-get -y install cron

RUN /usr/local/bin/composer install -d /var/www/magento2

# install nginx
RUN apt-get install -y nginx
RUN rm /etc/nginx/sites-available/default
RUN chmod +x /var/www/magento2/deploy/magento-setup.sh

COPY php.ini /usr/local/etc/php/conf.d/php.ini

CMD ["sh", "./deploy/boot.sh"]
