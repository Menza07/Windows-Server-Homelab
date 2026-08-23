# Windows Server Backup & Recovery

## Installation

Windows Server Backup was installed on **FS01** using PowerShell:

```powershell
Install-WindowsFeature Windows-Server-Backup
```

Feature status after installation: **Installed**

> Note: A warning about automatic updating not being enabled was displayed, but the feature installed successfully.

## Backup Disk

| Disk   | Size  | Drive | Purpose                  |
|--------|-------|-------|--------------------------|
| Disk 0 | 60 GB | C:    | OS + CompanyData         |
| Disk 1 | 20 GB | E:    | Dedicated backup volume (`FS01-Backup`) |

Keeping backups on a separate virtual disk is intentional and follows good practice.

## First Backup

**Method:** Windows Server Backup → Backup Once → Custom

- Selected: `C:\CompanyData`
- Estimated size: ~8.79 GB
- Destination: `E:\` (FS01-Backup)

## Full Backup → Delete → Restore Test

A complete recovery test was performed:

1. **Created** a test text file from WIN10-01 in `CompanyData\Public`
2. **Backed up** `C:\CompanyData` on FS01
3. **Deleted** the test file from WIN10-01 (file removed from FS01 share)
4. **Recovered** the file using Windows Server Backup → Recover → Files and folders
5. **Verified** the file reappeared on WIN10-01

### Result

| Step     | Outcome     |
|----------|-------------|
| Backup   | ✅ Successful |
| Deletion | ✅ Confirmed |
| Restore  | ✅ Successful |
| Verification | ✅ File recovered |

This confirms a working end-to-end backup and recovery process for critical file-share data.
