#!/bin/sh

sudo su -
yum install -y git \
  mercurial \
  subversion \
  yum-utils \
  device-mapper-persistent-data \
  lvm2

#
# setup docker environment
#

yum remove -y docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-selinux \
  docker-engine-selinux \
  docker-engine

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install -y docker-ce

curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

systemctl start docker
systemctl enable docker

groupadd docker
gpasswd -a vagrant docker
systemctl restart docker

#
# setup open-faas environment
#

docker swarm init --advertise-addr=192.168.33.40
curl -sL cli.openfaas.com | sudo sh
faas-cli template pull
git clone https://github.com/openfaas/faas
cd faas &&  git checkout master
./deploy_stack.sh --no-auth
