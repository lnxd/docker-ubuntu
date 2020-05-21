FROM ubuntu:20.04

# Install default apps
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y python3 python3-pip nano ncdu p7zip-full wget git sudo

# Set timezone
RUN ln -fs /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

# Prevent error messages when running sudo
RUN echo "Set disable_coredump false" >> /etc/sudo.conf

# Create user account
RUN useradd docker
RUN echo 'docker:docker' | sudo chpasswd
RUN usermod -aG sudo docker

# Set environment variables.
ENV HOME /home/docker

# Define working directory.
WORKDIR /home/docker

# Define default command.
CMD ["bash"]