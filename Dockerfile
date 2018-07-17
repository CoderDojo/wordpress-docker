FROM wordpress:latest
RUN apt-get update && apt-get install -y git wget sudo && git clone https://github.com/CoderDojo/cd-theme.git ~/tmp/cd-theme
COPY wp-init.sh /usr/local/bin/wp-init.sh
RUN chmod +x /usr/local/bin/wp-init.sh

COPY .htaccess /usr/src/wordpress/.htaccess
RUN chown "www-data:www-data" /usr/src/wordpress/.htaccess

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P ~/tmp
RUN chmod +x ~/tmp/wp-cli.phar
RUN mv ~/tmp/wp-cli.phar /usr/local/bin/wp
RUN wp --info

RUN sed -i -e 's/^exec "$@"/#exec "$@"/g' /usr/local/bin/docker-entrypoint.sh
RUN cat /usr/local/bin/wp-init.sh >> /usr/local/bin/docker-entrypoint.sh
CMD ["apache2-foreground"]
