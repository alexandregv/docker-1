FROM ubuntu:16.04

RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends ca-certificates curl openssh-server postfix

WORKDIR /
RUN curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && bash script.deb.sh

RUN apt-get update && EXTERNAL_URL="http://gitlab.example.com" apt-get install -yq gitlab-ce

# https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2229
RUN apt update && apt install -y tzdata && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN touch /.dockerenv
RUN echo "/opt/gitlab/embedded/bin/runsvdir-start&" > /start.sh
RUN echo "EXTERNAL_URL=\"localhost\" && gitlab-ctl reconfigure" >> /start.sh
RUN echo "while true; do sleep 2; done" >> /start.sh
RUN chmod +x /start.sh

EXPOSE 80 443 22

CMD ["/bin/bash", "/start.sh"]

# Pour creer une machine avec plus de RAM/CPUs:
# docker-machine create --driver virtualbox --virtualbox-memory 4096 --virtualbox-cpu-count 4 gitlab-machine
