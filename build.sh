#!/bin/bash

git submodule init

# rocksdb
#cd rocksdb && git checkout 6.29.fb && cd ..

# gflags
#cd gflags git checkout tags/v2.0 -b v2.0 && cd ..

rm -rf build/librocksdb.a
docker build -t rocksdb-compiler .
docker run -it --rm -v `pwd`/build:/opt/rocksdb/build rocksdb-compiler sh compile.sh