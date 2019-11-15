#!/bin/bash 

./test.sh orig 2>&1 |tee native_orig.log
./test.sh gtsan 2>&1 |tee native_gtsan.log
./test.sh tx 2>&1 |tee native_tx.log
./test.sh tsan 2>&1 |tee native_tsan.log

