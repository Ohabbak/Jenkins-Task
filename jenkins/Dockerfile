FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y \
        openjdk-11-jdk \
        openssh-server \
        curl
RUN apt-get install -y vim
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh 
RUN mkdir /var/run/sshd

CMD ["/usr/sbin/sshd", "-D"]