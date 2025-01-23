FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y \ 
    rpm \
    dpkg-dev \ 
    build-essential \
    git \
    curl \
    sudo \
    && apt-get clean
USER jenkins
