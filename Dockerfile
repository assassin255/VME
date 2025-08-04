FROM ubuntu:22.04

# Install SSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# Set root password (⚠ thay đổi sau)
RUN echo 'root:toor123' | chpasswd

# Permit root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose port 2222
EXPOSE 2222

# Run SSH server on port 2222
CMD ["/usr/sbin/sshd", "-D", "-p", "2222"]
