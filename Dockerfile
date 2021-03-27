FROM ubuntu:20.04

ENV SOURCE="https://github.com/xmrig/xmrig.git"

# Set timezone
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    ln -fs /usr/share/zoneinfo/Australia/Melbourne /etc/localtime; \
    apt-get install -y tzdata; \
    dpkg-reconfigure --frontend noninteractive tzdata; \
    apt-get clean all


# Install default apps
RUN export DEBIAN_FRONTEND=noninteractive;\
    apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y sudo git build-essential cmake libuv1-dev libssl-dev libhwloc-dev; \
    apt-get clean all; \

# Prevent error messages when running sudo
    echo "Set disable_coredump false" >> /etc/sudo.conf

# Create user account
RUN useradd docker; \
    echo 'docker:docker' | chpasswd; \
    usermod -aG sudo docker; \
    mkdir /home/docker

# Set environment variables.
ENV HOME /home/docker

# Define working directory.
WORKDIR /home/docker

# Define default command.

CMD ["init.sh"]