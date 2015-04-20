

#/usr/local/bin/qemu-system-x86_64 -m 1024 -boot c \
#-drive file=/home/nicklin/ExpImg/F20.img,if=virtio \
#-device pci-assign,host=02:10.1 \
#-netdev type=tap,script=/home/nicklin/dosomething/qemu-ifup,id=net0 \
#-device virtio-net-pci,netdev=net0 \

#test---pcipass(82599 NIC)#
#/usr/local/bin/qemu-system-x86_64 -m 1024 -boot c \
#-drive file=/home/nicklin/ExpImg/F20.img,if=virtio \
#-device pci-assign,host=02:10.0 \
#-netdev type=tap,script=none,id=net0 \
#-device virtio-net-pci,netdev=net0 \

#test---pcipass+bridge#
#/usr/local/bin/qemu-system-x86_64 -m 1024 -boot c \
#-drive file=/home/nicklin/ExpImg/F20.img \
#-device pci-assign,host=02:10.0 \
#-device e1000,netdev=net0 \
#-netdev tap,ifname=tap0,id=net0,script=no \

#test---only bridge without script#
#/usr/local/bin/qemu-system-x86_64 -m 1024 -boot c \
#-drive file=/home/nicklin/ExpImg/F20.img \
#-device e1000,netdev=net0 \
#-netdev tap,ifname=tap0,id=net0,script=no \

#test---only bridge with script#
#sh /home/nicklin/qemu-ifup.sh tap0

#/usr/local/bin/qemu-system-x86_64 -m 1024 -boot c \
#-drive file=/home/nicklin/ExpImg/F20.img \
#-device e1000,netdev=net0 \
#-netdev tap,ifname=tap0,id=net0,script=no \

#test---virtio#
#sh /home/nicklin/qemu-ifup.sh tap0

#/usr/local/bin/qemu-system-x86_64 -m 1024 -boot c \
#-drive file=/home/nicklin/ExpImg/F20.img,if=virtio \
#-netdev type=tap,ifname=tap0,id=net0,script=no \
#-device virtio-net-pci,netdev=net0 \




#/usr/local/bin/qemu-system-x86_64 -m 1024 -boot c -localtime -cpu host \
#-enable-kvm --no-kvm-pit \
#-drive file=/home/nicklin/ExpImg/vm1.img \
#-net nic,macaddr=52:54:00:12:34:22,model=e1000,addr=08 -net user,hostfwd=tcp::2222-:22 \
#-device pci-assign,host=02:10.0 \
#-netdev tap,ifname=tap0,vhost=on,id=net0,script=no \
#-device virtio-net-pci,netdev=net0 \


#-nographic \
#-device pci-assign,host=02:10.0 \
#-netdev tap,ifname=tap0,vhost=on,id=net0,script=no \
#-device virtio-net-pci,netdev=net0 \



/home/nicklin/dosomething/qemu-kvm-1.0/x86_64-softmmu/qemu-system-x86_64 -m 1024 -boot c -localtime -cpu host,+x2apic \
-enable-kvm --no-kvm-pit -nographic \
-drive file=/home/nicklin/vm1fortest.img \
-net nic,macaddr=52:54:00:12:34:22,model=e1000,addr=08 -net user,hostfwd=tcp::2222-:22 \
-netdev tap,ifname=tap0,vhost=on,id=net0,script=no




