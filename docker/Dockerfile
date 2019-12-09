FROM ubuntu:18.04

ENV DEBIAN_FRONTEND="noninteractive"

ENV PKGS="sudo vim curl wget git zip unzip python3 build-essential libx11-dev libxext-dev libxxf86vm-dev imagemagick mesa-common-dev libglu1-mesa-dev freeglut3-dev jlha-utils gdb"

RUN apt-get update && \
    apt-get install -y ${PKGS} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*  && \
    ln -sf /usr/bin/python3 /usr/bin/python

RUN echo 'Defaults env_keep += "ftp_proxy http_proxy https_proxy no_proxy"' >> etc/sudoers && chmod 0440 /etc/sudoers

# Everything below is for easy conversion of internal user to match host uid/gid and setup sudo
ADD https://raw.githubusercontent.com/jpward/extsdk-container/master/restrict_groupadd.sh \
    https://raw.githubusercontent.com/jpward/extsdk-container/master/restrict_useradd.sh  \
    https://raw.githubusercontent.com/jpward/extsdk-container/master/usersetup.py \
    https://raw.githubusercontent.com/jpward/poky-container/master/poky-entry.py \
    https://raw.githubusercontent.com/jpward/poky-container/master/poky-launch.sh \
    /usr/bin/
 
ADD https://raw.githubusercontent.com/jpward/poky-container/master/sudoers.usersetup /etc/sudoers.d/usersetup
ADD https://raw.githubusercontent.com/jpward/poky-container/master/sudoers.developer /etc/sudoers.d/developer

RUN groupadd -g 70 usersetup && \
    useradd -N -m -u 70 -g 70 usersetup && \
    chmod 0440 /etc/sudoers.d/usersetup && \
    chmod 0440 /etc/sudoers.d/developer && \
    chmod 755 /usr/bin/usersetup.py \
        /usr/bin/poky-entry.py \
        /usr/bin/poky-launch.sh \
        /usr/bin/restrict_groupadd.sh \
        /usr/bin/restrict_useradd.sh && \
    echo 'export PATH=${PATH}:~/bin' >> /etc/bash.bashrc

USER usersetup
ENV LANG=en_US.UTF-8

ENTRYPOINT ["/usr/bin/poky-entry.py"]
