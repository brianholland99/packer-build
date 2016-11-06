install
lang en_US.UTF-8
keyboard us
text
skipx
network  --bootproto=dhcp
repo --name=epel --baseurl=http://dl.fedoraproject.org/pub/epel/7/x86_64/
auth --enableshadow --passalgo=sha512 --kickstart
rootpw vagrant
firstboot --disabled
timezone --utc UTC
firewall --disabled
selinux --permissive
unsupported_hardware
zerombr
clearpart --all --initlabel
bootloader --location=mbr
part biosboot --fstype biosboot --size=1
part /        --fstype xfs      --size=1 --grow
reboot
user --name=vagrant --plaintext --password vagrant

%packages --nobase --ignoremissing --excludedocs
@core
-fprintd-pam
-intltool
-*firmware
epel-release
%end

%post
# sudo
echo "%vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

%end
