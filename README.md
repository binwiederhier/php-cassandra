# DataStax PHP Driver for Apache Cassandra

This is a Debian package for the [DataStax PHP Driver for Apache Cassandra](https://github.com/datastax/php-driver). To create the package, simply run:

```
apt-get install debhelper php-pear cmake libuv0.10 libuv0.10-dev libgmp-dev
git clone https://github.com/binwiederhier/php-cassandra.git
cd php-cassandra
git submodule update --init --recursive
dpkg-buildpackage
```
