# Smart DNS / Proxy Setup Script

This script automates the setup of a smart DNS server and proxy on a CentOS 9 Linode instance to allow restricted traffic based on specified IP addresses.

## Linode Setup
1. **Create a Linode Instance:**
   - Access the Linode control panel [here](https://cloud.linode.com/linodes/create).
   - Choose CentOS 9 as the OS.
   - Select a region close to your target audience (e.g., Paris for European users).
   - Opt for a suitable plan like Shared CPU Nanode (1 GB).

## Running the Setup Script
1. **SSH into Your Linode:**
   ```bash
   ssh root@<your-linode-ip>
   ```

2. **Download and Configure the Setup Script:**
   ```bash
   wget https://example.com/path/to/setup.sh -O setup.sh
   ```

3. **Edit the Setup Script:**
   ```bash
   nano setup.sh
   ```

4. **Configure the Script:**
   - Replace `<IP>` with your specific IP address or `all` to allow all traffic (not recommended for security reasons).

5. **Make the Script Executable and Run It:**
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

   This will execute the setup script and configure the smart DNS server and proxy.

## Managing Firewall Rules
### Adding IPs to Firewall
```bash
firewall-cmd --zone=smartdns --add-source=<IP>
firewall-cmd --reload
```

### Removing IPs from Firewall
```bash
firewall-cmd --zone=smartdns --remove-source=<IP>
firewall-cmd --reload
```

## Using the Smart DNS Server
1. **Update DNS Settings:**
   - Update your router, device, or application DNS settings to point to the Linode instance's IP address.

2. **Limit Traffic (Optional):**
   - Configure DNS resolution to limit traffic (e.g., by domain name) based on your needs (e.g., pfSense: Services > DNS Resolver > Domain Overrides).

**Note:** The smart DNS server also acts as a proxy, so be aware of potential bandwidth usage and associated charges.

By following these steps, you can effectively set up and manage your smart DNS server and proxy for controlled traffic routing.
```
