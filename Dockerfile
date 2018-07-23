FROM wordpress:4.9.7-php7.1-apache
RUN apt-get update && apt-get install -y git wget sudo unzip && git clone https://github.com/CoderDojo/cd-theme.git /usr/src/wordpress/wp-content/themes/cd-theme
COPY wp-init.sh /usr/local/bin/wp-init.sh
RUN chmod +x /usr/local/bin/wp-init.sh

# antispam bee 2.8.1
RUN wget -q https://downloads.wordpress.org/plugin/antispam-bee.2.8.1.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/antispam-bee.2.8.1.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/antispam-bee.2.8.1.zip

# caldera forms v1.7.2
RUN wget -q https://downloads.wordpress.org/plugin/caldera-forms.1.7.2.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/caldera-forms.1.7.2.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/caldera-forms.1.7.2.zip

# google captcha by bestwebsoft v1.36
RUN wget -q https://downloads.wordpress.org/plugin/google-captcha.1.36.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/google-captcha.1.36.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/google-captcha.1.36.zip

# google xml sitemaps v4.0.9
RUN wget -q https://downloads.wordpress.org/plugin/google-sitemap-generator.4.0.9.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/google-sitemap-generator.4.0.9.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/google-sitemap-generator.4.0.9.zip

# pods v2.7.6
RUN wget -q https://downloads.wordpress.org/plugin/pods.2.7.6.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/pods.2.7.6.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/pods.2.7.6.zip

# redirection v3.4
RUN wget -q https://downloads.wordpress.org/plugin/redirection.3.4.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/redirection.3.4.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/redirection.3.4.zip

# S3 Uploads
RUN wget -q https://github.com/humanmade/S3-Uploads/archive/f9f09b1ead9e07032ee1eb406a237b1273fe55ed.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/f9f09b1ead9e07032ee1eb406a237b1273fe55ed.zip -d /usr/src/wordpress/wp-content/plugins && mv /usr/src/wordpress/wp-content/plugins/S3-Uploads-f9f09b1ead9e07032ee1eb406a237b1273fe55ed /usr/src/wordpress/wp-content/plugins/S3-Uploads && rm /usr/src/wordpress/wp-content/plugins/f9f09b1ead9e07032ee1eb406a237b1273fe55ed.zip

# sucuri security v1.8.18
RUN wget -q https://downloads.wordpress.org/plugin/sucuri-scanner.1.8.18.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/sucuri-scanner.1.8.18.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/sucuri-scanner.1.8.18.zip

# tablepress v1.9
RUN wget -q https://downloads.wordpress.org/plugin/tablepress.1.9.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/tablepress.1.9.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/tablepress.1.9.zip

# timber v1.7.1
RUN wget -q https://downloads.wordpress.org/plugin/timber-library.1.7.1.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/timber-library.1.7.1.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/timber-library.1.7.1.zip

# wondermo00ns open graph v2.2.4.2
RUN wget -q https://downloads.wordpress.org/plugin/wonderm00ns-simple-facebook-open-graph-tags.2.2.4.2.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/wonderm00ns-simple-facebook-open-graph-tags.2.2.4.2.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/wonderm00ns-simple-facebook-open-graph-tags.2.2.4.2.zip

# wp super cache v1.6.2
RUN wget -q https://downloads.wordpress.org/plugin/wp-super-cache.1.6.2.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/wp-super-cache.1.6.2.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/wp-super-cache.1.6.2.zip 

# wp-mail-smtp v1.3.3
RUN wget -q https://downloads.wordpress.org/plugin/wp-mail-smtp.1.3.3.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/wp-mail-smtp.1.3.3.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/wp-mail-smtp.1.3.3.zip

# sassy-social-share v3.2.2 (3.2.3 is available but not published)
RUN wget -q https://downloads.wordpress.org/plugin/sassy-social-share.3.2.2.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/sassy-social-share.3.2.2.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/sassy-social-share.3.2.2.zip

# stripe 6.3.0
RUN wget -q https://github.com/stripe/stripe-php/archive/v6.3.0.zip -P /usr/src/wordpress/ && unzip -qq /usr/src/wordpress/v6.3.0.zip -d /usr/src/wordpress/ && rm /usr/src/wordpress/v6.3.0.zip
COPY plugins/donation/payment.php /usr/src/wordpress/payment.php

COPY .htaccess /usr/src/wordpress/.htaccess
RUN chown "www-data:www-data" /usr/src/wordpress/.htaccess

RUN mkdir /var/log/sucuri
COPY confs/sucuri-settings.php /var/log/sucuri/sucuri-settings.php
COPY confs/sucuri-wp-content-htaccess /usr/src/wordpress/wp-content/.htaccess
COPY confs/sucuri-wp-includes-htaccess /usr/src/wordpress/wp-includes/.htaccess
RUN rm /usr/src/wordpress/readme.html

RUN mkdir /usr/src/wordpress/wp-content/cache
COPY confs/wp-super-cache.php /usr/src/wordpress/wp-content/wp-cache-config.php
RUN chown "www-data:www-data" /usr/src/wordpress/wp-content/wp-cache-config.php
COPY confs/wp-supercache-htaccess /usr/src/wordpress/wp-content/cache/.htaccess
COPY plugins/activator /usr/src/wordpress/wp-content/plugins/activator

COPY confs/php.ini /usr/local/etc/php/conf.d/php.ini

RUN wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P ~/tmp
RUN chmod +x ~/tmp/wp-cli.phar
RUN mv ~/tmp/wp-cli.phar /usr/local/bin/wp
RUN wp --info

RUN sed -i -e 's/^exec "$@"/#exec "$@"/g' /usr/local/bin/docker-entrypoint.sh
RUN cat /usr/local/bin/wp-init.sh >> /usr/local/bin/docker-entrypoint.sh
CMD ["apache2-foreground"]
