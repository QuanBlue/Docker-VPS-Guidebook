FROM alpine:latest
LABEL maintainer="QuanBlue <quannguyenthanh558@gmail.com>"

USER root 

ARG USER
ENV USER=${USER}

# install openrc
RUN apk add --update --no-cache docker openrc 

# Start the Docker daemon at boot
RUN rc-update add docker boot

# install and config ssh
RUN apk add --update --no-cache openssh 
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# add user, create home directory and set shell
RUN apk add doas 
RUN adduser -h /home/${USER} -s /bin/sh -D ${USER} 
RUN echo "${USER}:123" | chpasswd 
RUN echo "permit ${USER} as root" > /etc/doas.d/doas.conf

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]


