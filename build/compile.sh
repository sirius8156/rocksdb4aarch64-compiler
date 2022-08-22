#!/bin/bash

cd   /opt/rocksdb/rocksdb
make static_lib -j8
cp   -rf /opt/rocksdb/rocksdb/librocksdb.a /opt/rocksdb/build/