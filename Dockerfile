FROM centos:latest
LABEL maintainer="babygod"

RUN yum install -y openssh-server && \
    yum clean all && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    echo 123456 | passwd --stdin root 

# ADD authorized_keys /root/.ssh/

EXPOSE 22/tcp 

CMD ["/usr/sbin/sshd","-D"]
