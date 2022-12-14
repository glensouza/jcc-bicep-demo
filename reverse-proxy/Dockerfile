FROM nginx:stable-alpine
COPY default.conf /etc/nginx/conf.d
COPY not-found.html /var/www/html/not-found.html
EXPOSE 80/tcp
EXPOSE 443/tcp
CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]
WORKDIR /usr/share/nginx/html
