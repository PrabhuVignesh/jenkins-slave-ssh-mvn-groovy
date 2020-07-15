FROM ubuntu
RUN mkdir -p /var/run/sshd
RUN apt -y update
RUN apt-get -y install curl && \
    apt-get -y install unzip && \
    apt-get -y install zip && \
    curl -s get.sdkman.io | bash
RUN apt install -y openjdk-8-jdk
RUN apt install -y openssh-server
RUN apt-get install -qy git
RUn apt-get install -qy maven
RUN ssh-keygen -A
ADD ./sshd_config /etc/ssh/sshd_config
RUN echo root:password123 | chpasswd
CMD ["/usr/sbin/sshd", "-D"]
