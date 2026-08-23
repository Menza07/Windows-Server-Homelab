# Troubleshooting Log

This document records real issues encountered during the lab build and how they were resolved.

---

## 1. DHCP Failure / APIPA Address

**Symptom**  
Client received `169.254.174.14 / 16` (APIPA address).

**Error Message**  
`Unable to contact your DHCP server. Request has timed out.`

**Investigation Areas**
- VMware networking (VMnet8)
- Virtual network adapters
- DHCP configuration on DC01
- Client IP configuration
- DNS settings

**Resolution**  
Corrected network/DHCP configuration. Client subsequently received a normal lease from the `192.168.59.0/24` scope (e.g. 192.168.59.100 / 192.168.59.101).

---

## 2. One-Way Ping Failures

**Symptom**  
Some computers could ping others, but not vice versa.

**Root Cause**  
Windows Firewall was blocking ICMP Echo Requests.

**Resolution**  
Enabled the appropriate **ICMPv4 Echo Request** inbound rule.  
Also created/used a custom rule named `Homelab - Allow ICMPv4 Ping`.

After the change, bidirectional connectivity tests succeeded.

---

## 3. DNS Resolution Quirks

**Observation**  
`nslookup` sometimes showed `Server: Unknown` even though the actual resolution to `192.168.59.10` was successful.

**DNS servers observed at different stages**
- 192.168.59.10 (intended / current)
- 127.0.0.1
- ::1

**Current intended configuration**  
Preferred DNS on all lab machines: `192.168.59.10`

---

## 4. Remote Desktop Availability

**Issue**  
RDP connection failed at times.

**Investigation**
- Network connectivity
- Sleep / power settings
- RDP configuration

**Resolution**  
Adjusted power settings on the target machine so it no longer automatically sleeps, keeping it available for remote administration.

---

## Useful Commands & Tools Used

### Networking
```powershell
ipconfig
ipconfig /all
ipconfig /release
ipconfig /renew
ping
arp -a
nslookup
Test-NetConnection
```

### Management Consoles
- Active Directory Users and Computers
- DHCP Management
- DNS Management
- Group Policy Management
- Windows Firewall with Advanced Security
- Computer Management
- Disk Management
- Event Viewer
- services.msc
- Task Manager
- Resource Monitor
- msinfo32
