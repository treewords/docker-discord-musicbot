FROM ubuntu:eoan

LABEL maintainer="treewords <gheonea.iulian@gmail.com>"

RUN apt-get -y update \
    && apt-get -y install openjdk-14-jdk \
    git
	
RUN git clone https://github.com/treewords/docker-discord-musicbot.git /root/docker-discord-musicbot


VOLUME ["/root/docker-discord-musicbot"]


WORKDIR /root/docker-discord-musicbot

ADD start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "/start.sh"]
