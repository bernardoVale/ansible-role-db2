FROM oraclelinux:7.2

# Get DB2
RUN curl ftp://transfer.lb2.com.br/downloads/connections/DB2_Svr_10.5.0.3_Linux_x86-64.tar.gz -o /tmp/db2.tar.gz
# Install Ansible and dependences
RUN curl https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -o epel-release-latest-7.noarch.rpm

RUN yum install -y epel-release-latest-7.noarch.rpm; \
yum install -y glibc.i686; \
rm -rf epel-release-latest-7.noarch.rpm

RUN yum install -y unzip tar gcc python-devel python-pip openssl-devel file python-setuptools libffi-devel libselinux-python python2-crypto git sudo

RUN pip install ansible; \
sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers; \
mkdir -p /etc/ansible/roles; \
echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

CMD ["/usr/sbin/init"]