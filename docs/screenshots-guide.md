# Screenshot Guide for the Homelab GitHub

This guide tells you **exactly** which screenshots to take and where to take them so your GitHub repository looks professional and proves your work.

---

## Recommended Screenshots (Priority Order)

### 1. High-Level Architecture (Very Important)
**Where:** VMware Workstation  
**What to capture:**
- The three VMs running side-by-side (DC01, FS01, WIN10-01)
- Show their power state (green / powered on)
- Optionally show the network settings (VMnet8)

**Why:** This is the first thing people look at. It proves the whole lab exists.

---

### 2. Active Directory Users and Computers
**Where:** On DC01 → Start → Active Directory Users and Computers  
**What to capture:**
- The full tree showing `homelab.local`
- The **IT Department** OU expanded
- At least one user you created (e.g. IT Administrator)
- Security Groups if you have any

**Tip:** Maximize the window and expand the important containers.

---

### 3. DNS Manager
**Where:** On DC01 → DNS Manager  
**What to capture:**
- Forward Lookup Zones → `homelab.local`
- Show the SOA and NS records + the DC01 A record (192.168.59.10)

---

### 4. DHCP Manager
**Where:** On DC01 → DHCP  
**What to capture:**
- IPv4 → Scope → Address Leases
- Show at least one active lease (WIN10-01)

---

### 5. Group Policy Management
**Where:** On DC01 → Group Policy Management  
**What to capture:**
- The policy that disables Command Prompt
- The policy that maps the Z: and P: drives (if visible)

---

### 6. File Share & Permissions (FS01)
**Where:** On FS01  
**What to capture (2–3 screenshots):**
1. File Explorer showing `C:\CompanyData` and the `Public` folder
2. Sharing tab of `CompanyData` (SMB permissions)
3. Security tab of the `Public` folder (NTFS permissions – Domain Users = Modify)

---

### 7. Mapped Drives on Client
**Where:** On WIN10-01  
**What to capture:**
- File Explorer showing the **Z:** and **P:** drives
- Open one of them and show a file you created

This is excellent proof that Group Policy is working.

---

### 8. Windows Server Backup
**Where:** On FS01 → Windows Server Backup  
**What to capture:**
1. The successful backup job (Backup Once or the history)
2. The Recovery wizard / successful restore confirmation

---

### 9. Successful Restore Proof (Optional but impressive)
**Where:** WIN10-01  
**What to capture:**
- The test text file that was deleted and then restored appearing again

---

### 10. Network / IP Configuration (Optional)
**Where:** On each machine  
**What to capture:**
- `ipconfig /all` output for DC01 and FS01 (showing static IPs and DNS)

---

## How to Take Good Screenshots

### On Windows Server / Windows 10
1. Press `Win + Shift + S` → Select the area (Snipping Tool)
2. Or use the full **Snipping Tool** / **Snip & Sketch**
3. Save as **PNG** (best quality)

### Recommended naming convention
```
01-vmware-overview.png
02-aduc-users-and-ous.png
03-dns-manager.png
04-dhcp-leases.png
05-gpo-command-prompt.png
06-gpo-mapped-drives.png
07-fs01-companydata-share.png
08-fs01-public-ntfs.png
09-win10-mapped-drives.png
10-backup-success.png
11-restore-success.png
```

Put all screenshots in the `diagrams/` folder of the repository.

---

## Pro Tips for GitHub

- Crop out unnecessary desktop clutter
- Use a clean background (default Windows theme is fine)
- Prefer **full window** captures rather than tiny partial shots
- Add a short caption under each image in the Markdown files later
- Aim for 8–12 good screenshots — quality over quantity

---

Once you have the screenshots, just drop them into the `diagrams/` folder and I can help you update the README to display them nicely.
