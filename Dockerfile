FROM ubuntu:eoan

LABEL maintainer="treewords <gheonea.iulian@gmail.com>"

ENV BOT_USER="2000" \
    BOT_GROUP="2000" \
    BOT_DIR="/musicbot" \
    BOT_DL_URL="https://github.com/treewords/docker-discord-musicbot.git"	

RUN groupadd -g "$BOT_GROUP" musicbot && \
    useradd -u "$BOT_USER" -g "$BOT_GROUP" -d "$BOT_DIR" musicbot

RUN apt-get -y update \
    && apt-get -y install openjdk-14-jdk \
    git
 
RUN mkdir -p "$BOT_DIR" && \
    git clone "$BOT_DL_URL" "$BOT_DIR"
	
COPY start.sh /start.sh
RUN chmod 0755 /start.sh

USER musicbot
WORKDIR "$BOT_DIR"

VOLUME ["$BOT_DIR"]

CMD ["/bin/bash", "/start.sh"]
