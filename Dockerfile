FROM php:7.2-fpm

RUN apt update \
    && apt -y install apache2 \
    && mkdir -p /code \
    && a2enmod proxy_fcgi

COPY 000-default.conf /etc/apache2/sites-available/

EXPOSE 80
EXPOSE 443

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
