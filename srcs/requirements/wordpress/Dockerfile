FROM debian:bullseye

RUN apt-get update -y && apt-get install curl php7.4 mariadb-client php7.4-fpm php7.4-mysql -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY tools/script.sh /
RUN chmod +x script.sh
CMD ["./script.sh"]