# My docker file


FROM php:7.4-cli

#install package for composer installation
RUN apt update -y && apt install -y libmcrypt-dev

#install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#install php extension for laravel
#RUN docker-php-ext-install  mbstring

WORKDIR /
COPY . /

RUN /usr/local/bin/composer install

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000