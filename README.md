# Debian package DataStax PHP Driver for Apache Cassandra

**THIS IS WORK IN PROGRESS**

This is a Debian package for the [DataStax PHP Driver for Apache Cassandra](https://github.com/datastax/php-driver). 

## Requirements
Ubuntu 16.04+

## Building
To create the package, simply run:
```
apt-get install debhelper php-pear cmake libuv0.10 libuv0.10-dev libgmp-dev
git clone https://github.com/binwiederhier/php-cassandra.git
cd php-cassandra
git submodule update --init --recursive
dpkg-buildpackage
```

## Installation
After that, you can install it using:

```
dpkg -i ../php-cassandra_*deb
apt-get install -f
```
