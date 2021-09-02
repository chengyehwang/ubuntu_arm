FROM ubuntu:20.04
MAINTAINER ChengYehWang
RUN apt update

RUN export DEBIAN_FRONTEND=noninteractive && apt-get upgrade -y
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y x11-apps psmisc sudo sshfs wget python net-tools vim git make gcc apt-utils libnss3 iproute2 libgtk2.0-0 libgconf-2-4 libnotify-dev

SHELL ["/bin/bash", "-c", "-l"]



ARG USER_ID=502
ARG GROUP_ID=502
ARG USER=ubuntu

RUN export PASSWD=`openssl passwd ${USER}` && \
    groupadd -g ${GROUP_ID} ${USER} && \
    useradd -l -m -u ${USER_ID} -g ${USER} -G sudo -p $PASSWD -s /bin/bash ${USER} && \
    install -d -m 0755 -o ${USER} -g ${USER} /home/${USER}

RUN chown -R ${USER}:${USER} /home/${USER}


USER ${USER}
