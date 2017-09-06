FROM node:8.1.2
MAINTAINER Azure App Services Container Images <appsvc-images@microsoft.com>


COPY sshd_config /etc/ssh/
COPY startup /opt/

RUN cd /opt \
  && npm install

RUN mkdir -p /home/LogFiles \
     && echo "root:Docker!" | chpasswd \
     && apt update \
     && apt install -y --no-install-recommends openssh-server

	 
#TRy again


EXPOSE 2222 8080


ENV PORT 8080

ENV PATH ${PATH}:/home/site/wwwroot

WORKDIR /home/site/wwwroot

ENTRYPOINT ["/opt/init_container.sh"]