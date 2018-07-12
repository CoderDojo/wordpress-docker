FROM wordpress:latest
RUN apt-get update && apt-get install -y git wget && git clone https://github.com/CoderDojo/cd-theme.git ~/tmp/cd-theme
COPY wp-init.sh /usr/local/bin/apache2-get-cd-theme.sh
RUN chmod +x /usr/local/bin/apache2-get-cd-theme.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P ~/tmp
RUN chmod +x ~/tmp/wp-cli.phar
RUN mv ~/tmp/wp-cli.phar /usr/local/bin/wp
RUN wp --info