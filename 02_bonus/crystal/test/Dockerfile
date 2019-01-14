FROM crystallang/crystal
MAINTAINER "aguiot--@student.42.fr"
LABEL maintainer="aguiot--@student.42.fr"

VOLUME /app
WORKDIR /app

#CMD shards install && crystal tool format src/ && crystal run src/*.cr
CMD shards install \
    && crystal tool format \
    && crystal run src/*.cr
