build_images:
#	docker build -t cogn/redis:latest $(PWD)/redis
#	docker build -t cogn/mysql:latest $(PWD)/mysql
#	docker build -t cogn/php:latest $(PWD)/php
#	docker build -t cogn/nginx:latest $(PWD)/nginx
	docker-compose build

remove_none_images:
	docker rmi $$(docker images|grep none|awk '{print $3}')

remove_images: stop_containers
	docker rmi -f $$(docker images -q)

start_containers:
#	docker run --name cogn_redis \
#	-d cogn/redis:latest

#	docker run --name cogn_mysql \
#	-d cogn/mysql:latest

#	docker run --name cogn_php \
#	-v $(PWD)/app/src:/var/www/html \
#	--link cogn_redis:redis \
#	--link cogn_mysql:mysql \
#	-d cogn/php:latest

#	docker run --name cogn_nginx \
#	-p 81:80 \
#	-v $(PWD)/app/src:/var/www/html \
#	--link cogn_php:php \
#	-d cogn/nginx:latest

	docker-compose up -d

stop_containers:
#	docker stop $$(docker ps -q)
#	docker rm $$(docker ps -a -q)
	docker-compose down

setup: build_images start_containers
	git submodule update --remote && cd app/src && php composer.phar install

test:
	docker exec -it cogn_php /bin/bash /data/test.sh
