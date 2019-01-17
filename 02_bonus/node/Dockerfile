FROM node
MAINTAINER "aguiot--@student.42.fr"

WORKDIR /var/www/app

RUN apt-get update && apt-get install -y apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get -y install yarn

COPY . /var/www/app

RUN yarn

EXPOSE 3000

CMD ["node", "index.js"]
