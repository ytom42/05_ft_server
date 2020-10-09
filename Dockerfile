# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ytomiyos <ytomiyos@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/12 21:20:41 by ytomiyos          #+#    #+#              #
#    Updated: 2020/09/21 15:19:17 by ytomiyos         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN		apt-get	update
RUN		apt-get -y install	nginx
RUN		apt-get -y install	mariadb-server
RUN		apt-get -y install	php php-fpm php-mysql
RUN		apt-get -y install	wget vim
RUN		apt-get -y install	php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
RUN		apt-get -y install	mariadb-client

WORKDIR	/tmp
RUN		wget https://wordpress.org/latest.tar.gz &&\
		tar -xzvf latest.tar.gz &&\
		mv /tmp/wordpress /var/www/html/

WORKDIR	/var/www/html/wordpress
RUN		mv wp-config-sample.php wp-config.php &&\
		chown www-data.www-data /var/www/html/wordpress/* -R &&\
		chown www-data.www-data /var/www/html/wordpress -R

WORKDIR	/tmp
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz &&\
		tar -xzvf phpMyAdmin-5.0.2-all-languages.tar.gz &&\
		mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin

RUN		service mysql start &&\
		mysql -e "CREATE DATABASE wp_database" &&\
		mysql -e "CREATE USER user@localhost IDENTIFIED BY 'pass'" &&\
		mysql -e "GRANT ALL PRIVILEGES ON wp_database.* TO user@localhost"

COPY	/srcs/default.conf /etc/nginx/sites-available/default
COPY	/srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY	/srcs/nginx.conf /etc/nginx/nginx.conf

# CMD		nginx && service mysql start && /etc/init.d/php7.3-fpm start
