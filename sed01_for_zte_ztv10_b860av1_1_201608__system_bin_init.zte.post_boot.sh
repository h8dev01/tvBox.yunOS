#!/system/bin/sh

# increase receive socket buffer
echo "zte post boot sh"

# increase receive socket buffer
echo 131072 > /proc/sys/net/core/rmem_default
echo 4194304 > /proc/sys/net/core/rmem_max
echo 4194304 > /proc/sys/net/core/wmem_max
#echo 20000  21000 > /proc/sys/net/ipv4/ip_local_port_range
echo 2 > /proc/sys/net/ipv4/conf/eth0/force_igmp_version
echo 5 > /proc/sys/net/ipv4/tcp_syn_retries
echo 5 > /proc/sys/net/ipv4/tcp_synack_retries


#echo 2 > /sys/module/amvdec_h264/parameters/error_recovery_mode
#echo 2 > /sys/module/amvdec_mpeg12/parameters/error_frame_skip_level


echo 4096 174760 11264000 > /proc/sys/net/ipv4/tcp_rmem
setprop net.tcp.buffersize.default 4096,174760,11264000,4096,16384,4194304
echo 4096 16384 4194304 > /proc/sys/net/ipv4/tcp_wmem
cd /dev/
chmod 777 /dev/miomap
chmod 777 /dev/malloc
chmod -R 777 /dev/snd
chmod 777 /dev/semutex
chmod 666 system
chmod 666 ashmem
chmod 666 cmapool
chmod 666 device-mapper
chmod 666 mem
chmod 666 video0
chmod 0777 /data/media
chmod 0777 /data/media/0

setprop config.Android.AppInstallCtrl 3
sleep 30 && settings put global install_non_market_apps 1
adbd&
busybox telnetd -l /system/bin/sh&
setprop config.Android.AppInstallCtrl 3

dhcpcd -d eth0 &

setprop AutoStartIptv 0
setprop sys.AutoStartIptv 0
setprop ConTimeout 9999999999
setprop ServiceUser 999999999
setprop ServicePwd 9999999
setprop PppoeUser  9999999999
setprop PppoePwd  9999999999
setprop DHCPPUser  9999999999
setprop DHCPPPw   9999999999
setprop persist.sys.bytuetech.username tv11111111111@itv
setprop sys.DHCPAccessUserName         tv11111111111@itv
setprop sys.PPPOEAccessUserName        tv11111111111@itv


setprop init.svc.clearWDT running
setprop init.svc.net-eth0 running
setprop init.svc.preinstall running


