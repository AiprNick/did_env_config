
./host_network-setting.sh

./qemu-ifup.sh tap0

./mount_ftrace.sh

service iptables stop

service irqbalance stop

#echo $1 > /sys/devices/system/cpu/cpu2/online



