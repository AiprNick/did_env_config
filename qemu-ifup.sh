# script to bring up the tun device in QEMU in bridged mode 
# first parameter is name of tap device (e.g. tap0)
#
# some constants specific to the local host - change to suit your host
#
# in /etc/qemu-ifup 
#!/bin/sh
#/usr/sbin/openvpn --mktun --dev $1 --user `id -un`
#ifconfig $1 promisc up
#brctl addif br0 $1
#ifconfig $1
#


ETH0IPADDR=192.168.2.11
GATEWAY=192.168.2.254
BROADCAST=192.168.2.255
dev=p1p1

#dev=em1

#
# First take eth0 down, then bring it up with IP address 0.0.0.0 
#
/sbin/ifdown $dev 
/sbin/ifconfig $dev 0.0.0.0 promisc up
#
# Bring up the tap device (name specified as first argument, by QEMU)
#
/usr/sbin/openvpn --mktun --dev $1 --user `id -un`
/sbin/ifconfig $1 0.0.0.0 promisc up
#
# create the bridge between eth0 and the tap device
#
/usr/sbin/brctl addbr br0
/usr/sbin/brctl addif br0 $dev
/usr/sbin/brctl addif br0 $1
# 
# only a single bridge so loops are not possible, turn off spanning tree protocol
#
/usr/sbin/brctl stp br0 off
# 
# Bring up the bridge with ETH0IPADDR and add the default route 
#
/sbin/ifconfig br0 $ETH0IPADDR netmask 255.255.255.0 broadcast $BROADCAST
#/sbin/route add default gw $GATEWAY
