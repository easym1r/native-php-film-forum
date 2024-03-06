# Используем последний базовый образ Alpine
FROM alpine:latest

# Обновляем пакеты системы
RUN apk update && apk upgrade

# Устанавливаем Bash TODO
# RUN apk add --no-cache bash \

# Устанавливаем NGINX
RUN apk add --no-cache nginx

# Устанавливаем PHP и пакеты для него
RUN apk add --no-cache php82 \
    php82-fpm

# Копирование рабочей конфигурацию nginx в путь к конфигурации nginx внутри alpine
COPY .docker/nginx/nginx.conf /etc/nginx/http.d/default.conf

# Копирование всех файлов текущей рабочей директории в директории по умолчанию для сервера NGINX
COPY . /usr/share/nginx/html

# Открываем рабочий порт
EXPOSE 80

# Запуск Nginx и PHP-FPM
CMD php-fpm82 && nginx -g "daemon off;"
#CMD ["/bin/bash", "-c", "php-fpm82 && chmod 755 /usr/share/nginx/html/* && nginx -g 'daemon off;'"]