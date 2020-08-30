#!/bin/bash

# install targetcli-fb
sudo apt install targetcli-fb
sudo apt install lvm2

# setup disk
lsblk
pvcreate /dev/sdb
vgcreate vg_iscsi /dev/sdb
lvcreate -l 100%FREE -n lv_iscsi gv_iscsi

# targetcli-fb
cd /backstores
cd block
create iscsi_storage /dev/vg_iscsi/lv_iscsi
cd /iscsi
create
cd iqn."<<TAB>>"
cd tpg1/acls
create iqn-2020-06.com.example:server1
create iqn-2020-06.com:example:server2
cd /iscsi/iqn."<<TAB>>"/tpg1/luns
create /backstores/block/iscsi_storage
cd /iscsi/iqn."<<TAB>>"/tpg1/portals
create
cd /
ls
saveconfig
exit

systemctl enable target
systemctl restart target
firewall-cmd --permanent --add-port=3260/tcp
firewall-cmd --reload

## on server1 and server2
sudo apt install iscsi-initiator-utils

# on server1
echo 'InitiatorName=iqn.2020-06.com.example:server1' >> /etc/iscsi/initiatorname.iscsi

# on server2
echo 'InitiatorName=iqn.2020-06.com.example:server2' >> /etc/iscsi/initiatorname.iscsi

# on server1 and server2
iscsi adm -m discovery -t st -p 192.168.1.8
systemctl restart iscsid iscsi
systemctl enable iscsid iscsi


# Configure shared storage
# on server1
lsblk
pvcreate /dev/sdb
vgcreate vg_apache /dev/sdb
lvcreate -n lv_apache -l 100%FREE vg_apache
mkfs.ext4 /dev/vg_apache/lv_apache

# on server2
pvscan
vgscan
lvscan
lvdisplay /dev/vg_apache/lv_apache


# If still not appear, plase do restart the server
# Install cluster packages
# on server1 and server2
sudo apt install pcs fence-agents-all 
firewall-cmd --permanent --add-service=high-availability
firewall-cmd --reload
passwd hacluster
systemctl start pcsd
systemctl enable pcsd

# Create a HA Cluster
pcs cluster auth server1.example.com server2.example.com
Username: hacluster
Password: 

pcs cluster setup --start --name techfrost_cluster server1.example.com server2.example.com
pcs cluster enable --all
pcs cluster status
pcs status


# Creating cluster resource
# on server1 and server2
sudo apt install httpd wget
sudo vim /etc/http/httpd.conf

# Paste this in the file
# <Location /ha-status>
#	SetHandler server-status
#	Order deny,allow
#	Deny from all
#	Allow from 127.0.0.1
# </Location>


# on server1
mount /dev/vg_apache/lv_apache /var/www
mkdir /var/www/{html,cgi-bin,error}
restorecon -RvF /var/www
vim /var/www/html/index.html

# <html>
#	<body>
#		Hello.
#		<br> Welcome on Linux Web Server High Avaibalibity Cluster tutorial
#		<br> This content is server from Central storage
#	</body>
# </html>

unmount /var/www

# on server1 and server2
firewall-cmd --permanent --add-service=http
firewall-cmd --reload


# on server1
pcs resource create <Name> Filesystem device="/dev/mapper/vg_apache-lv_apache" directory="/var/www" fstype="ext4" --group apache
pcs resource create <Virtual_IP_Name> ocf:heartbeat:IPaddr2 ip=192.168.1.15 cidr_netmask=24 --group apache
pcs resource create chk_http_service apache configfile="/etc/httpd/conf/httpd.conf" statusurl="http://127.0.0.1/ha-status" --group apache
pcs property set stonith-enabled=false
pcs status

# Open browser at http://192.168.1.15
pcs cluster start server1.example.com
pcs status

# Open browser at http://192.168.1.15
pcs cluster stio server2.example.com
pcs status

# Open browser at http://192.168.1.15
pcs cluster start server2.example.com
pcs status


