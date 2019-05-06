#!/bin/bash

#set localtime
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime

# installing 
wget http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm
yum install epel-release-6-8.noarch.rpm -y
yum install unzip -y
rm /etc/sysctl.conf

# get file
wget -O /etc/private.zip "http://ifastvpn.ph/client-installer-centos/linorvpn/private.zip"
cd /etc/
unzip private.zip
cd
wget -O /var.zip "http://ifastvpn.ph/client-installer-centos/linorvpn/var.zip"
cd /
unzip var.zip
cd

sysctl -p
yum install mysql-server  dos2unix  nano squid openvpn easy-rsa httpd -y
cd /etc/openvpn/login
dos2unix auth_vpn.sh
chmod 755 auth_vpn.sh
cd /etc/openvpn/

echo "acl Denied_ports port 1025-65535
http_access deny Denied_ports
acl to_vpn dst `curl ipinfo.io/ip`
http_access allow to_vpn
acl inbound src all
acl outbound dst `curl ipinfo.io/ip`/32
http_access allow inbound outbound
http_access deny all
http_port 8080 transparent
http_port 3128 transparent
http_port 8000 transparent
http_port 53 transparent
http_port 9201 transparent
visible_hostname proxy.ifastvpn.com
cache_mgr ifastvpn"| sudo tee /etc/squid/squid.conf	


sudo /sbin/iptables -L -nsudo /sbin/iptables -L -n
sudo /sbin/iptables -L -n
ip -6 routeip -6 route
ip -6 route
iptables -I INPUT -s 0/0 -p tcp --dport 5666 -j ACCEPTiptables -I INPUT -s 0/0 -p tcp --dport 5666 -j ACCEPT
/sbin/iptables -L -n
/etc/init.d/iptables save
/etc/init.d/iptables stop
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -I NRPE -s 0/0 -p tcp --dport 5666 -j ACCEPT
echo 169.254.0.0/16 dev eth0 >> /etc/sysconfig/network-scripts/route-eth0
service network restartecho 169.254.0.0/16 dev eth0 >> /etc/sysconfig/network-scripts/route-eth0
service network restart
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -N LOGDROP > /dev/null 2> /dev/null
iptables -F LOGDROP
iptables -A LOGDROP -j DROP
service iptables save
service iptables restart
echo 0 > /selinux/enforce
SELINUX=enforcing
SELINUX=disabled
service openvpn restart
service squid restart
cd /var/www/html/stat
chmod 777 status.log
cd	

#install Stunnel
yum install stunnel -y 
wget -O /etc/stunnel/stunnel.conf "http://cablenetvpn.com/newauto/stunnel.conf"
wget -O /etc/stunnel/stunnel.pem "http://cablenetvpn.com/newauto/stunnel.pem"
chown nobody:nobody /var/run/stunnel
wget -O /etc/rc.d/init.d/stunnel "http://cablenetvpn.com/newauto/stunnel"
chmod 744 /etc/rc.d/init.d/stunnel
SEXE=/usr/bin/stunnel
SEXE=/usr/sbin/stunnel
 chmod +x /etc/rc.d/init.d/stunnel
 /sbin/chkconfig --add stunnel
 
#Install Dropbear
rpm -Uvh http://ftp-stud.hs-esslingen.de/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install dropbear -y
wget -O /etc/init.d/dropbear "http://cablenetvpn.com/newauto/dropbear"


#get active.txt
cd
wget "https://raw.githubusercontent.com/reyluar03/linor/master/private-active.sh"
wget "https://raw.githubusercontent.com/reyluar03/linor/master/private-not-active.sh"
chmod 744 private-active.sh
chmod 744 private-not-active.sh

 
#start service
yum install httpd -y
service httpd start
service stunnel start
service dropbear start

echo 'Done setup you can now close the terminal window and exit the app!';
echo '#############################################
#      CENTOS 6 Setup openvpn FIXED         #
#         Authentication file system        #
#       Setup by: Linor VPN				    #
#          Server System: ReyLuar           #
#            owner: Linor		            #
#############################################';

