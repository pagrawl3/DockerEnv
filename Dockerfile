# Base image
FROM ubuntu:14.04

# Put my info as the maintainer
MAINTAINER Pratham Agrawal <mail@prath.am>

# Suppress some front-end warnings in Ubuntu
RUN DEBIAN_FRONTEND=noninteractive

# Install OS tools we'll need
RUN \
	apt-get update && \
	apt-get -y install curl && \
	curl -sL https://deb.nodesource.com/setup | bash - && \
	apt-get -y install nodejs && \
	apt-get -y install build-essential && \
	apt-get -y install git && \
	apt-get -y install zsh

# Install Oh-My-ZSH to replace bash, so much better
RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash

# Set environment variables
ENV HOME /root

# Define working dir
WORKDIR /root

# Define default command to execute upon launching Docker
CMD ["/bin/zsh"]
