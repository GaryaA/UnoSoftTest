FROM cassandra:4.1

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN --mount=type=secret,id=ssh_root_password \
    echo "root:$(cat /run/secrets/ssh_root_password)" | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

CMD ["/bin/bash", "-c", "service ssh start && exec docker-entrypoint.sh cassandra -f"]
