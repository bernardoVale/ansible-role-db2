FROM oraclelinux:7.2

# Install Ansible and dependences
RUN curl https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -o epel-release-latest-7.noarch.rpm; \
yum install -y epel-release-latest-7.noarch.rpm; \
rm -rf epel-release-latest-7.noarch.rpm; \
yum install -y python-setuptools libselinux-python python2-crypto git sudo; \
easy_install ansible; \
sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers; \
mkdir /etc/ansible; \
echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

CMD ["/usr/sbin/init"]