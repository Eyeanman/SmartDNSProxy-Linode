#!/bin/bash
IP_01="XX.XX.XX.XX"

yum -y -q install wget epel-release
yum -y -q install supervisor go
go install github.com/mosajjal/sniproxy/v2@latest
mkdir /opt/bin
mv /root/go/bin/sniproxy /opt/bin/sniproxy
cat > /etc/supervisord.d/sniproxy.ini <<-EOM
[program:sniproxy]
command=/opt/bin/sniproxy
numprocs=1
autostart=true
autorestart=unexpected
stdout_logfile=/var/log/supervisor/sniproxy.log
redirect_stderr=true
EOM
systemctl unmask firewalld
systemctl enable firewalld
systemctl restart firewalld
firewall-cmd --permanent --new-zone=smartdns
firewall-cmd --permanent --zone=smartdns --add-service=ssh
firewall-cmd --permanent --zone=smartdns --add-service=dns
firewall-cmd --permanent --zone=smartdns --add-service=http
firewall-cmd --permanent --zone=smartdns --add-service=https
firewall-cmd --permanent --zone=smartdns --add-source=$IP_01
firewall-cmd --permanent --zone=public --remove-service=ssh
firewall-cmd --reload
systemctl enable supervisord
systemctl restart supervisord