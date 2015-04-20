rmmod ixgbe

#insmod /lib/modules/3.6.0-rc4/kernel/drivers/net/ethernet/intel/ixgbe/ixgbe.ko  max_vfs=1

modprobe ixgbe max_vfs=1

echo "8086 10ed" > /sys/bus/pci/drivers/pci-stub/new_id
echo 0000:02:10.0 > /sys/bus/pci/devices/0000\:02\:10.0/driver/unbind
echo 0000:02:10.0 > /sys/bus/pci/drivers/pci-stub/bind


ifconfig p1p1 192.168.2.11

