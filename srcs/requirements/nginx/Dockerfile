FROM debian:bullseye

RUN apt update -y && apt install openssl nginx -y

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

COPY --chmod=755 tools/script.sh /

CMD [ "./script.sh" ]