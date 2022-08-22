#!/bin/bash

git submodule init

#rocks db 6.9
cd rocksdb && git checkout 6.29.fb && cd ..
cd gflags git checkout tags/v2.0 -b v2.0 && cd ..