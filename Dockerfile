FROM ubuntu:eoan

LABEL maintainer="treewords <gheonea.iulian@gmail.com>"

ENV BOT_USER_USER="2000" \
    BOT_GROUP="2000" \
    BOT_DIR="/musicbot" \
    BOT_DL_URL="https://www.22hosting.net/download/docker-files/JMusicBot-0.2.8.tar.gz"
	
ENV BOT_PLAYLISTS="$BOT_DIR/Playlists" \
    BOT_CONFIG="$BOT_DIR/config.txt"
	
RUN apt-get -y update \
    && apt-get -y install apt-utils \
    openjdk-14-jdk \
	mkdir -p "$BOT_DIR" && \
	curl -sqL "$BOT_DL_URL" | tar zxvf -

USER musicbot
WORKDIR "$BOT_DIR"

VOLUME ["$BOT_PLAYLISTS", "$BOT_CONFIG"]

CMD /nohup java -Dnogui=true -jar JMusicBot-0.2.8.jar &