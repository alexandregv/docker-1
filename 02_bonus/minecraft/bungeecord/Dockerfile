FROM debian

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget default-jre

WORKDIR /bungeecord
COPY . /bungeecord

RUN wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT java -Xms256M -Xmx512M -jar BungeeCord.jar
