FROM nginx:latest

RUN mkdir /app

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html.tpl /usr/share/nginx/html/index.html.tpl

COPY envsubst.pl /docker-entrypoint.d/20-envsubst-on-index.pl.sh
ENV INDEX_IN /usr/share/nginx/html/index.html.tpl
ENV INDEX_OUT /usr/share/nginx/html/index.html

EXPOSE 80
