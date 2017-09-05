FROM node:8.1.2
MAINTAINER Azure App Services Container Images <appsvc-images@microsoft.com>


COPY sshd_config /etc/ssh/

RUN mkdir -p /home/LogFiles \
     && echo "root:Docker!" | chpasswd \
     && apt update \
     && apt install -y --no-install-recommends openssh-server



EXPOSE 2222 8080


ENV PORT 8080
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot

WORKDIR /home/site/wwwroot

ENTRYPOINT ["/opt/startup/init_container.sh"]