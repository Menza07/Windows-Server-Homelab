# Lab Architecture

## Virtualization Platform

- **Hypervisor:** VMware Workstation Pro 25H2
- **Network Mode:** VMnet8 (NAT) + custom Homelab-Internal network
- **Primary Lab Subnet:** `192.168.59.0/24`

## Topology

```
                    VMware Workstation Pro 25H2
                              │
                     ─────────┼─────────
                              │
                     192.168.59.0/24
                              │
             ┌────────────────┼────────────────┐
             │                │                │
             ▼                ▼                ▼
           DC01             FS01           WIN10-01
        192.168.59.10   192.168.59.20    DHCP address
             │                │                │
       AD DS / DNS       File Server       Windows 10
          DHCP          CompanyData        Domain Client
          GPO           Public
             │                │
             └───────┬────────┘
                     │
                 homelab.local
```

## Current IP Address Reference

### Confirmed / Static Addresses

| Device     | IP Address       | Type    | Role                              |
|------------|------------------|---------|-----------------------------------|
| DC01       | 192.168.59.10    | Static  | Domain Controller, DNS, DHCP, GPO |
| FS01       | 192.168.59.20    | Static  | File Server + Backup             |
| WIN10-01   | DHCP             | Dynamic | Domain-joined Windows 10 client   |
| Gateway    | 192.168.59.2     | —       | VMware NAT gateway                |

### Historical / Troubleshooting Addresses (not current)

| IP Address       | Context                              |
|------------------|--------------------------------------|
| 192.168.59.100   | Observed DHCP lease                  |
| 192.168.59.101   | Previously observed WIN10-01 address |
| 192.168.59.254   | Earlier configuration stage          |
| 192.168.59.129   | Earlier Ubuntu interface             |
| 169.254.174.14   | APIPA address during DHCP failure    |
| 127.0.0.1        | IPv4 loopback / DNS config           |
| ::1              | IPv6 loopback                        |


## Core Infrastructure Summary

| Component | Provides |
|-----------|----------|
| **DC01**  | Active Directory, Domain (`homelab.local`), DNS, DHCP, Group Policy |
| **FS01**  | SMB File Sharing (`CompanyData`), Public folder, Windows Server Backup |
| **WIN10-01** | Domain workstation, GPO testing, Mapped drives, File-share access verification |
