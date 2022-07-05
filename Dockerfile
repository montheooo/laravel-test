# My docker file

FROM prooph/composer:7.3
#FROM php:7.4-cli


#install composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#install php extension for laravel
#RUN docker-php-ext-install  mbstring

WORKDIR /app
COPY . /app

RUN composer update
RUN composer install



EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000