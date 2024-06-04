FROM debian:bullseye

RUN apt update -y && apt install nginx -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

COPY --chmod=755 tools/script.sh /

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

CMD [ "./script.sh" ]