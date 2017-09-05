FROM node:8.1.2


RUN apt-get update \ 
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "root:Docker!" | chpasswd
  

COPY sshd_config /etc/ssh/
EXPOSE 2222 80
  
COPY init_container.sh /bin/
RUN chmod 755 /bin/init_container.sh 
ENTRYPOINT ["/bin/init_container.sh"]
