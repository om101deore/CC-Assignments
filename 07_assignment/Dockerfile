FROM ubuntu:latest
WORKDIR /var/www/html
COPY src/ /var/www/html

RUN apt-get update && \
    apt-get install -y \ 

ENV DEBIAN_FRONTEN=noninteractive

EXPOSE 80

RUN chown -R www-data:www-data /var/www/html

CMD service apache2 start 
