# Smart DNS / Proxy Setup Script

This script will setup a smartdns server and proxy to allow restricted traffic to work from the designated IPs

## Linode Setup
From the Linode control panel (https://cloud.linode.com/linodes/create), create a new Linode:
* For OS, choose CentOS9
* For region, choose something like Paris (close location and allows the restricted traffic)
* For Linode Plan, choose Shared CPU -> Nanode 1 GB

## Script Setup
SSH into the Linode and copy setup.sh to somewhere.
```
cd /root
nano setup.sh
```

Paste in the setup.sh file contents. Save the file, updating the IP address to your own IP address, or `all` to allow all traffic (not recommended!)
Then give it permissions to run, and run it.
```
chmod setup.sh 755
./setup.sh
```

If you make changes to the file (eg. add a new IP address). The setup.sh file can just be re-run.

## Maintenance
Add IP's to firewall
From command line
```
firewall-cmd --zone=smartdns --add-source=<IP>
firewall-cmd --reload
```

Remove IP's from firewall
From command line
```
firewall-cmd --zone=smartdns --remove-source=<IP>
firewall-cmd --reload
```

## Using the Smart DNS Server
Update your router/device/application DNS Server to the IP address of the Linode Instance, ideally limiting the traffic to only what you need (e.g. by Domain Name - In pfSense this is under Services>DNS Resolver>Domain Overrides)

** Note that its not just a DNS server but also a proxy, meaning you will be charged for bandwidth used **