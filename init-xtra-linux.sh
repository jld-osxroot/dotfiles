
## Debian Server Setup


# set locale
locale-gen en_US.UTF-8
/usr/sbin/update-locale LANG=en_US.UTF-8
dpkg-reconfigure locales
echo SITENAME.DOMAIN >/etc/hostname

# create user
useradd -G adm --shell /bin/bash mkaz
passwd mkaz
mkdir -p /home/mkaz
chown mkaz:adm /home/mkaz

## Follow Instructions Here for Hardening:
# http://joshrendek.com/2013/01/securing-ubuntu/
 
# vi /etc/ssh/sshd_config
# PermitRootLogin no
# PasswordAuthentication no
# UsePAM no
sudo cp /etc/sysctl.conf /etc/sysconf.conf.orig
sudo cp extras/sysctl.conf /etc/sysctl.conf

# turn on firewall
# use ufw firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw limit ssh
sudo ufw allow www

# remove multi-arch support (default ubuntu)
dpkg --remove-architecture i386

# disable ipv6
echo "blacklist ipv6" > /etc/modprobe.d/blacklist.conf
echo "net.ipv6.conf.all.disable_ipv6=1" > /etc/sysctl.d/disableipv6.conf


# power saving
# /etc/default/grub
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash pcie_aspm=force i915.lvds_downclock=1 drm.vblankoffdelay=1 i915.semaphores=1"


# vim: syntax=sh ts=4 sw=4 sts=4 sr et
