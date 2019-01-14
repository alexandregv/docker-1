FROM ruby:2.4

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nodejs
RUN gem install rails

ONBUILD WORKDIR /opt/app
ONBUILD COPY . /opt/app

ONBUILD RUN bundle install
ONBUILD RUN rails db:migrate
ONBUILD RUN rails db:seed

#--- Pour tester:
# docker build -t ft-rails:on-build .
# git clone https://github.com/RailsApps/learn-rails test_app
# cd test_app
# vim Dockerfile (inserer Dockerfile de test du sujet)
# docker build -t test_app .
# docker run -d -p 3000:3000  test_app
