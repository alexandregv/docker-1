FROM ubuntu:16.04

RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends ca-certificates curl openssh-server postfix

WORKDIR /
RUN curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && bash script.deb.sh

#RUN bash script.deb.sh

RUN apt-get update && EXTERNAL_URL="http://gitlab.example.com" apt-get install -yq gitlab-ce
#ARG url
#RUN echo "http://${url}/"
#RUN apt-get update && EXTERNAL_URL="http://${url}/" apt-get install -yq gitlab-ce

# https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2229
RUN apt update && apt install -y tzdata && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 443 22

ADD https://gist.githubusercontent.com/rizkyario/bc236974f3b0c9ce60cdb722bf12a702/raw/634df1395ab9c4187250b81d1c4a38e7e0934779/gitlab-entrypoint.sh /start.sh
RUN touch /.dockerenv
#RUN echo "/opt/gitlab/embedded/bin/runsvdir-start&" > /entrypoint.sh
#RUN echo "EXTERNAL_URL=\"localhost\" && gitlab-ctl reconfigure" >> /start.sh
#RUN chmod +x /start.sh

CMD [ "/bin/bash", "/start.sh" ]
