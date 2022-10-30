FROM ubuntu:22.04
EXPOSE 8080
# prerequisites
RUN apt update -y
RUN apt upgrade -y
RUN dpkg --add-architecture i386 -y
RUN apt install wget -y
# add the wine repo with keys and install
RUN wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
RUN wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
RUN apt update -y
RUN apt install --install-recommends winehq-stable -y
# copy files folder and start farming simulator
COPY files .
RUN ["wine", "dedicatedServer.exe"]