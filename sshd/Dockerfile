FROM tmtk75/puppet-3.4.1

RUN yum install -y passwd openssh openssh-server openssh-clients sudo rsync

# create user
RUN useradd vagrant
RUN passwd -f -u vagrant
RUN mkdir -p /home/vagrant/.ssh; chown vagrant /home/vagrant/.ssh; chmod 700 /home/vagrant/.ssh
ADD ./.ssh/id_rsa.pub /home/vagrant/.ssh/authorized_keys
RUN chown vagrant /home/vagrant/.ssh/authorized_keys; chmod 600 /home/vagrant/.ssh/authorized_keys

# Enable ssh login
ADD ./etc/pam.d/sshd /etc/pam.d/sshd

# Disable `Defaults    requiretty`
ADD ./etc/sudoers /etc/sudoers
RUN chown root.root /etc/sudoers; chmod 600 /etc/sudoers

# setup sudoers
RUN echo "vagrant    ALL=(ALL)       ALL" >> /etc/sudoers.d/vagrant

# setup sshd and generate ssh-keys by init script
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

# launch sshd
CMD ["/usr/sbin/sshd", "-D"]
