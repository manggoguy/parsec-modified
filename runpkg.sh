#!/bin/bash
CFG=gcc-pthreads
#CFG=gcc-sniper-tcwithhot
#CFG=gcc-sniper
#CFG=gcc-sniper-tcnohot
./bin/parsecmgmt -a run -p parsec.$1 -c $CFG -i simlarge -n 4
