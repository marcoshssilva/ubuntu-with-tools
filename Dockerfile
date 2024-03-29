FROM ubuntu:mantic

USER root

RUN apt-get update && apt-get upgrade -y

# Install necessary packages for Docker installation
# RUN apt-get install -y \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     gnupg-agent \
#     software-properties-common

# Add Docker's official GPG key
# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Set up the Docker repository
# RUN add-apt-repository \
#   "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"

# Install Docker CE
# RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Install additional packages
RUN apt-get install gnupg -y
RUN apt-get install -y systemd git tree zip unzip tar gzip wget curl net-tools openssh-client telnet nano vim iputils-ping

# Create a user 'ubuntu' and set password
# RUN useradd -m ubuntu
RUN echo 'ubuntu:ubuntu' | chpasswd

# Switch back to the non-root user
USER ubuntu
WORKDIR /home/ubuntu

CMD ["journalctl", "-f"]
