#!/bin/bash
CFG=gcc-pthreads
#CFG=gcc-sniper-tcwithhot
#CFG=gcc-sniper
#CFG=gcc-sniper-tcnohot
./bin/parsecmgmt -a clean -p parsec.$1 -c $CFG
./bin/parsecmgmt -a uninstall -p parsec.$1 -c $CFG
./bin/parsecmgmt -a build -p parsec.$1 -c $CFG

