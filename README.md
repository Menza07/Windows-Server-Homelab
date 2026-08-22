# Windows Server Homelab — homelab.local

A fully functional Windows Server domain environment built for learning and practising enterprise IT skills.

*Platform:* VMware Workstation Pro 25H2  
*Domain:* homelab.local  
*Network:* 192.168.59.0/24 (VMnet8 / NAT + Homelab-Internal)

---

## Screenshots

### Lab Overview (VMware)
![VMware Overview](diagrams/01-vmware-overview.png)

### Active Directory Users and Computers
![Active Directory](diagrams/02-aduc-users-and-ous.png)

### Mapped Drives (Group Policy)
![Mapped Drives](diagrams/03-win10-mapped-drives.png)

### File Server Permissions
![File Server Permissions](diagrams/04-fs01-companydata-permissions.png)

### Windows Server Backup
![Backup Success](diagrams/05-backup-success.png)

### Group Policy
![Group Policy](diagrams/06-group-policy.png)

### DNS Manager
![DNS Manager](diagrams/07-dns-manager.png)

### DHCP Leases
![DHCP Leases](diagrams/08-dhcp-leases.png)

---

## Lab Overview

VMware Workstation Pro 25H2
                          │
                 192.168.59.0/24
                          │
         ┌────────────────┼────────────────┐
         │                │                │
         ▼                ▼                ▼
       DC01             FS01           WIN10-01
    192.168.59.10   192.168.59.20      DHCP
         │                │                │
   AD DS / DNS       File Server       Windows 10
      DHCP          CompanyData        Domain Client
      GPO           Public Folder


      

| Server / Client | Role                        | IP Address       | Status   |
|-----------------|-----------------------------|------------------|----------|
| *DC01*        | Domain Controller, DNS, DHCP, GPO | 192.168.59.10 (Static) | ✅ Online |
| *FS01*        | File Server + Windows Server Backup | 192.168.59.20 (Static) | ✅ Online |
| *WIN10-01*    | Domain-joined Windows 10 client | DHCP (from DC01) | ✅ Online |

---

## What This Lab Demonstrates

- ✅ New Active Directory Forest & Domain (homelab.local)
- ✅ DNS integration with Active Directory
- ✅ DHCP server configuration & troubleshooting
- ✅ Organizational Units, Users, Security Groups
- ✅ Account lockout policies & password management
- ✅ Group Policy (Command Prompt restriction + Mapped Drives)
- ✅ File Server with SMB shares
- ✅ NTFS + Share permissions (CompanyData / Public)
- ✅ Mapped network drives via GPO (Z: and P:)
- ✅ Windows Server Backup + full restore test
- ✅ Network troubleshooting (Firewall, ICMP, APIPA, DNS)
- ✅ Remote Desktop configuration

---

## Current Infrastructure Summary

### DC01 — Domain Controller
- *Hostname:* DC01
- *IP:* 192.168.59.10 / 24
- *Gateway:* 192.168.59.2
- *DNS:* 192.168.59.10
- *Roles:* Active Directory Domain Services, DNS, DHCP, Group Policy Management
- *Hardware:* 2 vCPU, 2 GB RAM, 60 GB disk

### FS01 — File Server
- *Hostname:* FS01
- *IP:* 192.168.59.20 / 24
- *Gateway:* 192.168.59.2
- *DNS:* 192.168.59.10
- *Roles:* File Server, Windows Server Backup
- *Storage:*
  - Disk 0 (60 GB) → OS + C:\CompanyData
  - Disk 1 (20 GB) → E:\FS01-Backup
- *Shares:* \\FS01\CompanyData (Public folder with Modify for Domain Users)

### WIN10-01 — Domain Client
- *Hostname:* WIN10-01
- *IP:* DHCP from DC01
- *Domain:* homelab.local
- Used for GPO testing, mapped drives, and file-share access verification

---

## Documentation

| Document | Description |
|----------|-------------|
| [Architecture](docs/architecture.md) | Full lab topology and IP reference |
| [Domain Controller (DC01)](docs/dc01.md) | AD DS, DNS, DHCP, promotion details |
| [Active Directory](docs/active-directory.md) | OUs, users, groups, lockout policy |
| [File Server (FS01)](docs/fs01.md) | Storage, shares, NTFS permissions |
| [Group Policy](docs/group-policy.md) | Policies and mapped drives |
| [Backup & Recovery](docs/backup-recovery.md) | Windows Server Backup + restore test |
| [Troubleshooting](docs/troubleshooting.md) | Network, DHCP, DNS, Firewall issues resolved |
| [Screenshot Guide](docs/screenshots-guide.md) | Exactly which screenshots to take and where |

---

## Skills Practised

| Category              | Skills |
|-----------------------|--------|
| *Identity*          | AD DS, Forest/Domain creation, OUs, Users, Groups |
| *Networking*        | Static IPs, DHCP scopes, DNS, VMware networking (VMnet8) |
| *Security*          | Account lockout, Logon restrictions, Windows Firewall, GPO |
| *File Services*     | SMB shares, NTFS permissions, Inheritance |
| *Client Management* | Domain join, GPO application, Mapped drives |
| *Backup*            | Windows Server Backup, File-level restore |
| *Troubleshooting*   | APIPA, ICMP blocking, DNS resolution, RDP |

---

## Repository Structure

---

## Future Improvements

- [ ] Additional Domain Controller (DC02) for redundancy
- [ ] Print Server role
- [ ] IIS / Web Server
- [ ] Certificate Services (AD CS)
- [ ] PowerShell automation scripts
- [ ] Monitoring / logging solution
- [ ] Additional Windows 10/11 clients

---

## Author

*Kamohelo Chaba*  
IT Support Intern | Goldfields TVET College  
[LinkedIn](https://linkedin.com/in/kamohelo-chaba-107155243)

---

Built for continuous learning and professional growth in Windows Server administration.
