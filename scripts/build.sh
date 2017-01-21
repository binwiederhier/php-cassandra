#!/bin/bash -ex

basedir=$(cd $(dirname $0); pwd)/..
builddir=$basedir/build

rm -rf $builddir

mkdir -p $builddir/cpp-driver
mkdir -p $builddir/out/lib
mkdir -p $builddir/out/include

echo "Compiling cpp-driver..."
cd $builddir/cpp-driver
cmake -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_INSTALL_PREFIX:PATH=$builddir -DCASS_BUILD_STATIC=ON \
  -DCASS_BUILD_SHARED=OFF -DCMAKE_BUILD_TYPE=RELEASE -DCASS_USE_ZLIB=ON \
  -DCMAKE_INSTALL_LIBDIR:PATH=lib $basedir/php-driver/lib/cpp-driver/
make

echo "PHP-izing extension ..."
cp -a $basedir/php-driver $builddir/php-driver
cd $builddir/php-driver/ext
phpize

echo "Compiling extension ..."
cp -a $builddir/cpp-driver/libcassandra_static.a $builddir/out/lib
cp -a $builddir/cpp-driver/libcassandra.so* $builddir/out/lib
cp $basedir/php-driver/lib/cpp-driver/include/cassandra.h $builddir/out/include 
cd $builddir/php-driver/ext
LIBS="-lssl -lz -luv -lm -lstdc++" LDFLAGS="-L$builddir/out/lib" \
   ./configure --with-cassandra=$builddir/out --with-libdir=lib
make

