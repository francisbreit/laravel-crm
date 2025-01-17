FROM php:8.1-fpm
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer
RUN apt update && apt install -y crudini git unzip libzip-dev zlib1g-dev libpng-dev libicu-dev
RUN docker-php-ext-configure gd --enable-gd
RUN docker-php-ext-install gd intl zip pdo_mysql
RUN rm -rf /tmp/* /var/cache/*
RUN apt clean && rm -rf /var/lib/apt/lists/*
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN /usr/bin/crudini --set $PHP_INI_DIR/php.ini PHP memory_limit 4G
RUN /usr/bin/crudini --set $PHP_INI_DIR/php.ini PHP max_execution_time 360
RUN /usr/bin/crudini --set $PHP_INI_DIR/php.ini PHP date.timezone Europe/Bucharest
