FROM ruby
MAINTAINER "aguiot--@student.42.fr"

WORKDIR /app
COPY . /app

RUN apt-get update
RUN gem install bundler jekyll
RUN jekyll new site 

ENTRYPOINT cd /app/site && bundle exec jekyll serve --host 0.0.0.0
