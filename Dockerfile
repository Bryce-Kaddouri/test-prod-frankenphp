FROM dunglas/frankenphp

ENV COMPOSER_ALLOW_SUPERUSER=1

# Be sure to replace "your-domain-name.example.com" by your domain name
ENV SERVER_NAME=bakerysystem.bryce-kaddouri.ie
# If you want to disable HTTPS, use this value instead:
#ENV SERVER_NAME=:80

# Enable PHP production settings
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the PHP files of your project in the public directory
#COPY . /app/public
# If you use Symfony or Laravel, you need to copy the whole project instead:
COPY . /app

RUN composer install
