FROM wordpress:4.9.7-php7.1-apache
RUN apt-get update && apt-get install -y git wget sudo unzip && git clone https://github.com/CoderDojo/cd-theme.git /usr/src/wordpress/wp-content/themes/cd-theme
COPY wp-init.sh /usr/local/bin/wp-init.sh
RUN chmod +x /usr/local/bin/wp-init.sh

# antispam bee 2.9.0
RUN wget -q https://downloads.wordpress.org/plugin/antispam-bee.2.9.0.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/antispam-bee.2.9.0.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/antispam-bee.2.9.0.zip

# caldera forms v1.7.4
RUN wget -q https://downloads.wordpress.org/plugin/caldera-forms.1.7.4.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/caldera-forms.1.7.4.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/caldera-forms.1.7.4.zip

# wp-fastest-cache v0.8.8.6
RUN wget -q https://downloads.wordpress.org/plugin/wp-fastest-cache.0.8.8.6.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/wp-fastest-cache.0.8.8.6.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/wp-fastest-cache.0.8.8.6.zip

# google captcha by bestwebsoft v1.37
RUN wget -q https://downloads.wordpress.org/plugin/google-captcha.1.37.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/google-captcha.1.37.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/google-captcha.1.37.zip

# google xml sitemaps v4.0.9
RUN wget -q https://downloads.wordpress.org/plugin/google-sitemap-generator.4.0.9.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/google-sitemap-generator.4.0.9.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/google-sitemap-generator.4.0.9.zip

# pods v2.7.9
RUN wget -q https://downloads.wordpress.org/plugin/pods.2.7.9.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/pods.2.7.9.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/pods.2.7.9.zip

# redirection v3.5
RUN wget -q https://downloads.wordpress.org/plugin/redirection.3.5.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/redirection.3.5.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/redirection.3.5.zip

# S3 Uploads
RUN wget -q https://github.com/humanmade/S3-Uploads/archive/f9f09b1ead9e07032ee1eb406a237b1273fe55ed.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/f9f09b1ead9e07032ee1eb406a237b1273fe55ed.zip -d /usr/src/wordpress/wp-content/plugins && mv /usr/src/wordpress/wp-content/plugins/S3-Uploads-f9f09b1ead9e07032ee1eb406a237b1273fe55ed /usr/src/wordpress/wp-content/plugins/S3-Uploads && rm /usr/src/wordpress/wp-content/plugins/f9f09b1ead9e07032ee1eb406a237b1273fe55ed.zip

# sucuri security v1.8.18
RUN wget -q https://downloads.wordpress.org/plugin/sucuri-scanner.1.8.18.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/sucuri-scanner.1.8.18.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/sucuri-scanner.1.8.18.zip

# tablepress v1.9.1
RUN wget -q https://downloads.wordpress.org/plugin/tablepress.1.9.1.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/tablepress.1.9.1.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/tablepress.1.9.1.zip

# timber v1.7.1
RUN wget -q https://downloads.wordpress.org/plugin/timber-library.1.7.1.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/timber-library.1.7.1.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/timber-library.1.7.1.zip

# Yoast SEO 9.0.3
RUN wget -q https://downloads.wordpress.org/plugin/wordpress-seo.9.0.3.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/wordpress-seo.9.0.3.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/wordpress-seo.9.0.3.zip

# wp-mail-smtp v1.3.3
RUN wget -q https://downloads.wordpress.org/plugin/wp-mail-smtp.1.3.3.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/wp-mail-smtp.1.3.3.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/wp-mail-smtp.1.3.3.zip

# sassy-social-share v3.2.5
# Developer tends to not have the latest version available on a specific URL (other than the latest URL), so make sure the URL exists before updating
RUN wget -q https://downloads.wordpress.org/plugin/sassy-social-share.3.2.5.zip -P /usr/src/wordpress/wp-content/plugins/ && unzip -qq /usr/src/wordpress/wp-content/plugins/sassy-social-share.3.2.5.zip -d /usr/src/wordpress/wp-content/plugins && rm /usr/src/wordpress/wp-content/plugins/sassy-social-share.3.2.5.zip

# stripe 7.0.2
RUN wget -q https://github.com/stripe/stripe-php/archive/v7.0.2.zip -P /usr/src/wordpress/ && unzip -qq /usr/src/wordpress/v7.0.2.zip -d /usr/src/wordpress/ && rm /usr/src/wordpress/v7.0.2.zip
COPY plugins/donation/payment.php /usr/src/wordpress/payment.php
COPY plugins/donation/process-payment.php /usr/src/wordpress/process-payment.php

COPY .htaccess /usr/src/wordpress/.htaccess
RUN chown "www-data:www-data" /usr/src/wordpress/.htaccess

RUN mkdir /var/log/sucuri
RUN touch /var/log/sucuri/sucuri-lastlogins.php
COPY confs/sucuri-settings.php /var/log/sucuri/sucuri-settings.php
COPY confs/sucuri-wp-content-htaccess /usr/src/wordpress/wp-content/.htaccess
COPY confs/sucuri-wp-includes-htaccess /usr/src/wordpress/wp-includes/.htaccess
RUN rm /usr/src/wordpress/readme.html

RUN a2enmod headers

COPY plugins/activator /usr/src/wordpress/wp-content/plugins/activator

COPY confs/php.ini /usr/local/etc/php/conf.d/php.ini
COPY confs/000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P ~/tmp
RUN chmod +x ~/tmp/wp-cli.phar
RUN mv ~/tmp/wp-cli.phar /usr/local/bin/wp
RUN wp --info

RUN sed -i -e 's/^exec "$@"/#exec "$@"/g' /usr/local/bin/docker-entrypoint.sh
RUN cat /usr/local/bin/wp-init.sh >> /usr/local/bin/docker-entrypoint.sh
CMD ["apache2-foreground"]
