./test_loop.sh  "./fft.google-tsan -p4 -m20" 5 2>&1 | grep real|cut -d'm' -f 2|cut -d's' -f1
