#!/bin/bash

# just in case it is run on non-disposable server
export PASSWORD=$(openssl rand -base64 12)

# just in case we need it after boot or smth
echo "export PASSWORD=$PASSWORD" > .env.sh
chmod +x .env.sh

# Install mariadb, sysbench, speedtest_cli, python

export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password $PASSWORD'
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password $PASSWORD'

apt-get update
apt-get -y upgrade
apt-get -y install mariadb-server
# apt-get -y install python3 python3-pip
apt-get -y install libmysqlclient-dev
apt-get -y install sysbench
wget https://github.com/zpeters/speedtest/releases/download/speed-issues/speedtest-linux-amd64-speed-issues
chmod 755 speedtest-linux-amd64-speed-issues

#pip3 install speedtest-cli


sysbench --test=fileio --file-total-size=6G prepare

mysql -uroot --password=$PASSWORD -e "create database test"
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=test --mysql-user=root --mysql-password=$PASSWORD prepare
