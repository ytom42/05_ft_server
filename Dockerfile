# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ytomiyos <ytomiyos@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/12 21:20:41 by ytomiyos          #+#    #+#              #
#    Updated: 2020/11/10 12:55:32 by ytomiyos         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN		apt-get	update &&\
		apt-get -y install	nginx &&\
		apt-get -y install	mariadb-server &&\
		apt-get -y install	php7.3 php7.3-fpm php7.3-mysql &&\
		apt-get -y install	wget vim

WORKDIR	/tmp
RUN		wget https://wordpress.org/latest.tar.gz &&\
		tar -xzvf latest.tar.gz &&\
		mv wordpress /var/www/html/ &&\
		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz &&\
		tar -xzvf phpMyAdmin-5.0.2-all-languages.tar.gz &&\
		mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin

WORKDIR	/var/www/html/wordpress
RUN		mv wp-config-sample.php wp-config.php

RUN		service mysql start &&\
		mysql -e "CREATE DATABASE wp_database" &&\
		mysql -e "CREATE USER user@localhost IDENTIFIED BY 'pass'" &&\
		mysql -e "GRANT ALL PRIVILEGES ON wp_database.* TO user@localhost"

WORKDIR /etc/nginx/
RUN		openssl req -newkey rsa:4096 \
		-x509 -sha256 -days 365 -nodes \
		-subj '/C=JP/ST=Tokyo/L=Minato/O=42tokyo/CN=42' \
		-out example.crt \
		-keyout example.key

COPY	/srcs/default.conf /etc/nginx/sites-available/default
COPY	/srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY	/srcs/nginx.conf /etc/nginx/nginx.conf

RUN		chown -R www-data:www-data /var/www/html/wordpress

ENV		AUTOINDEX=on

CMD		sed -i "s/autoindex on/autoindex $AUTOINDEX/" /etc/nginx/sites-available/default &&\
		nginx && service mysql start && service php7.3-fpm start &&\
		sleep 42d
