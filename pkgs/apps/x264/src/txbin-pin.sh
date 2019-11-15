
# profile call instructions that calls library functions leading to system calls
# repeat until become stable
for((iter=0;iter<1;iter++))
do

#$PIN_ROOT/pin -t /home/lzto/txgo/pintools/tx_prof/obj-intel64/tx_prof.so -o ${1}.prof.out -- ./${1}.prof.exe --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 4 -o eledream.264 eledream_640x360_128.y4m


$PIN_ROOT/pin -t /home/lzto/txgo/pintools/tx_prof/obj-intel64/tx_prof.so -o ${1}.prof.out -- ./${1}.prof.exe --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 4 -o eledream.264 eledream_640x360_8.y4m

sleep 1 
done

# simulate tx and evaluate memory footprint per tx
#$PIN_ROOT/pin -t /home/lzto/txgo/pintools/tx_prof/obj-intel64/tx_prof.so -o ${1}.prof.out -txsim 1 -- ./${1}.prof.exe 4 in_64K.txt prices.txt
