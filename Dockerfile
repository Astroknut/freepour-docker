FROM ubuntu:16.04

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2

RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR

# Update Ubuntu
RUN apt update && apt upgrade -y
# Get php Repo
RUN apt install -y \
    software-properties-common

#Update package list
RUN apt update
RUN apt install -y \
    locales \
    apache2 \
    libapache2-modsecurity \
    libapache2-mod-php \
    php-fpm \
    php \
    php-curl \
    php-dev \
    php-gd \
    php-mbstring \
    php-zip \
    php-xml \
    php-xdebug \
    vim \
    composer

EXPOSE 80 443

#Start
ENTRYPOINT /bin/bash
# CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]