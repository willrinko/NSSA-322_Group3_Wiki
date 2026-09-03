
• Architecture diagram (RLES VMs, Windows AD, pfSense, trust)
![alt text](image.png)

• Design decisions & justifications
### Windows Network
- Windows network: `192.168.1.0/24`
- pfSense gateway: `192.168.1.254`
- Windows Server: `WIN-DC01`
- Server IP: `192.168.1.10`
- Active Directory domain: `group3.com`

### DNS
- Configured the `group3.com` forward lookup zone.
- Configured the reverse lookup zone for `192.168.1.0/24`.
- Dynamic DNS updates are set to `Secure only`.

### DHCP
- DHCP is hosted on `WIN-DC01`.
- Option 003 Router: `192.168.1.254`
- Option 006 DNS Server: `192.168.1.10`
- Option 015 DNS Domain Name: `group3.com`

### pfSense
- LAN: `192.168.1.254`
- OPT1: `192.168.2.254`
- DHCP Relay forwards requests to `192.168.1.10`.

• Validation evidence (6–8 well-captioned screenshots + output)
## Activity 0 – DNS, DHCP, and pfSense Relay

### DNS Configuration

<img width="881" height="400" alt="Screenshot 2026-09-03 at 2 06 21 PM" src="https://github.com/user-attachments/assets/7a2921d3-4ff7-4188-862b-a47f8bb87b59" />

DNS forward lookup zone for group3.com showing WIN-DC01 at 192.168.1.10 and the Windows 11 client at 192.168.1.11.

###DNS Dynamic Update

<img width="396" height="491" alt="Screenshot 2026-09-03 at 2 18 51 PM" src="https://github.com/user-attachments/assets/8b653b35-65d8-4ae9-ad20-9e4ff2dd441b" />


group3.com is Active Directory-integrated and configured to allow secure dynamic DNS updates.

###Reverse Lookup Zone

<img width="883" height="352" alt="Screenshot 2026-09-03 at 2 20 02 PM" src="https://github.com/user-attachments/assets/34444245-ecd9-4757-8160-84dd189f5b16" />


Reverse lookup zone configured for the Windows 192.168.1.0/24 network to support IP-to-hostname resolution.

###Windows Connectivity + DNS Test

<img width="569" height="689" alt="Screenshot 2026-09-03 at 2 22 59 PM" src="https://github.com/user-attachments/assets/4688cc1d-07aa-4fa8-ad6a-0cefffcff9cc" />

Windows 11 successfully reached pfSense and WIN-DC01, and DNS resolved win-dc01.group3.com to 192.168.1.10

### DHCP Configuration

<img width="895" height="369" alt="Screenshot 2026-09-03 at 2 08 43 PM" src="https://github.com/user-attachments/assets/ba98e269-855b-4121-86a2-5784ecade66d" />

Windows DHCP scope options configured with pfSense (192.168.1.254) as the default gateway, WIN-DC01 (192.168.1.10) as DNS, and group3.com as the DNS suffix.

### pfSense DHCP Relay

<img width="742" height="608" alt="Screenshot 2026-09-03 at 2 11 00 PM" src="https://github.com/user-attachments/assets/994814c5-cebe-4f0e-8d8c-e2d7094de8e9" />

pfSense DHCP Relay configured on the Windows (LAN) and Linux (OPT1) interfaces, forwarding DHCP requests to the Windows DHCP server at 192.168.1.10.


### Windows Client Verification

<img width="679" height="625" alt="Screenshot 2026-09-03 at 2 12 06 PM" src="https://github.com/user-attachments/assets/ff0fc04f-3ae0-45f7-bf27-1b1374c31ac4" />

Windows 11 client successfully received its IP address, gateway, DNS server, and domain suffix from the Windows DHCP server.


• Troubleshooting journal (minimum 2–3 detailed entries)

• Links to primary official documentation

• Individual contribution note

