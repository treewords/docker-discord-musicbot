FROM ubuntu:eoan

LABEL maintainer="treewords <gheonea.iulian@gmail.com>"

ENV BOT_DIR="/musicbot" \
    BOT_DL_URL="https://github.com/treewords/JMusicBot.git"

RUN apt-get -y update \
    && apt-get -y install openjdk-14-jdk \
    git

WORKDIR /root
RUN mkdir -p "$BOT_DIR"

WORKDIR /root"$BOT_DIR"
RUN git clone "$BOT_DL_URL" "$BOT_DIR"


WORKDIR "$BOT_DIR"
ENTRYPOINT ["java", "-jar", "JMusicBot-0.2.8.jar"]
