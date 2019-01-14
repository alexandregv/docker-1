FROM debian

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget bzip2
RUN mkdir -p /home/teamspeak/server
RUN wget -O /home/teamspeak/serv.tar.bz2 https://files.teamspeak-services.com/releases/server/3.5.1/teamspeak3-server_linux_amd64-3.5.1.tar.bz2
RUN tar -jxf /home/teamspeak/serv.tar.bz2 -C /home/teamspeak/server --strip-components=1
RUN rm /home/teamspeak/serv.tar.bz2

EXPOSE 9987/udp
EXPOSE 30033/tcp
EXPOSE 10011/tcp
ENV TS3SERVER_LICENSE=accept
ENTRYPOINT ["/home/teamspeak/server/ts3server_minimal_runscript.sh"]

# Build image:	 docker build -t ts3 .
# Run container: docker run -d -p 9987:9987/udp -p 30033:30033 -p 10011:10011 ts3
