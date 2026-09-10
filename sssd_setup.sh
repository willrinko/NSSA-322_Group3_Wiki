#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
dnf install sssd
realm join group3l.com
cat  << EOF >> /etc/sssd/sssd.conf
[domain/group3.com]
subdomains_homedir = /home/%d/%u
default_shell = /bin/bash
fallback_homedir = /home/%u

[domain/group3l.com]
subdomains_homedir = /home/%d/%u
default_shell = /bin/bash
fallback_homedir = /home/%u
EOF 

authconfig --enablemkhomedir --update
systemctl enable --now oddjobd.service
