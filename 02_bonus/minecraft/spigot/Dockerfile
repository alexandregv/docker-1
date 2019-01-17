FROM debian
MAINTAINER "aguiot--@student.42.fr"

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget default-jre

WORKDIR /spigot
COPY . /spigot

RUN wget https://cdn.getbukkit.org/spigot/spigot-1.13.2.jar
RUN echo "eula=true" > eula.txt

EXPOSE 25566

ENTRYPOINT java -Xms1024M -Xmx2048M -jar spigot-1.13.2.jar
