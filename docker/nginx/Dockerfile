FROM nginx:${NGINX_VERSION:-1.18-alpine}

LABEL maintainer="Aloïs Micard <a.micard@vold.lu>"

# Setup user for Nginx with ID 1000
RUN adduser --uid 1000 --disabled-password --no-create-home dolibarr

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf

# Bundle Dolibarr
RUN rm -rf /var/www/html
COPY ./dolibarr /var/www/html