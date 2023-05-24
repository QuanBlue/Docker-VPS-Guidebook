FROM docker:latest

# install and config ssh
RUN apk add --update --no-cache openssh 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# add user, create home directory and set shell
RUN adduser -h /home/quanblue -s /bin/sh -D quanblue
RUN echo -n 'quanblue:123' | chpasswd

COPY entrypoint.sh /

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]

