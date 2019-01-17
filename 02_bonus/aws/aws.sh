#!/bin/sh

docker-machine create \
  --driver amazonec2 \
  --amazonec2-region eu-west-3 \
  --amazonec2-open-port 8080 \
  --amazonec2-open-port 8081 \
  --amazonec2-open-port 8082 \
  --amazonec2-root-size 8 \
  --amazonec2-access-key "AKIAJSO7QWJAWQ2VYO6A" \
  --amazonec2-secret-key "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" \
  aws-rs1
eval $(docker-machine env aws-rs1)
docker-machine ls
docker volume create aws-disk
docker run -d --name webserver -p 8080:80 nginx
docker run -d --name db -e MYSQL_ROOT_PASSWORD=mdp -e MYSQL_DATABASE=blog_db -v aws-disk:/var/spool/mysql mysql --default-authentication-plugin=mysql_native_password
docker run -d --name blog --link db:mysql -p 8081:80 wordpress
docker run -d --name phpmyadmin --link db:db -p 8082:80 phpmyadmin/phpmyadmin
docker ps
