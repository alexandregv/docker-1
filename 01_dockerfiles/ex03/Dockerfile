FROM ubuntu:16.04
MAINTAINER "aguiot--@student.42.fr"
LABEL maintainer="aguiot--@student.42.fr"

WORKDIR /

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends wget openssh-server ca-certificates postfix
RUN wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && chmod +x script.deb.sh && ./script.deb.sh
RUN apt-get install -y gitlab-ce
RUN apt-get install -y tzdata && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /script.deb.sh

RUN mkdir -p /etc/gitlab/ssl/ && chmod 700 /etc/gitlab/ssl/
RUN cd /etc/gitlab/ssl/ && openssl genrsa -out gitlab.domain.com.key 2048 && openssl req -new -x509 -key gitlab.domain.com.key -out gitlab.domain.com.crt -days 3650 -subj /CN=gitlab.domain.com
RUN echo "letsencrypt['enable'] = false" >> /etc/gitlab/gitlab.rb
RUN echo "gitlab_rails['gitlab_shell_ssh_port'] = 22" >> /etc/gitlab/gitlab.rb
RUN sed -i "s/^external_url.*/external_url \'https:\/\/gitlab.domain.com\'/" /etc/gitlab/gitlab.rb

RUN (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure

EXPOSE 80 443 22

ENTRYPOINT service ssh start && (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl start && echo "--------------------------------------" && gitlab-ctl tail 

# Pour creer une machine avec plus de RAM/CPUs:
# docker-machine create --driver virtualbox --virtualbox-memory 4096 --virtualbox-cpu-count 4 gitlab-machine
