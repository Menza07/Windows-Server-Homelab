# PowerShell Scripts

Starter scripts for the `homelab.local` environment.

| Script                  | Purpose                                      | Run on          |
|-------------------------|----------------------------------------------|-----------------|
| `New-HomelabUser.ps1`   | Create a new AD user in a specified OU       | DC01            |
| `New-HomelabOU.ps1`     | Create a new Organizational Unit             | DC01            |
| `Get-HomelabStatus.ps1` | Quick health check of AD, DNS, and services  | DC01 (preferred)|

---

## How to use

1. Copy the `.ps1` files to DC01 (or any machine with the Active Directory PowerShell module).
2. Open **PowerShell as Administrator**.
3. If needed, set execution policy for the session:
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ```
4. Run the script, for example:
   ```powershell
   .\New-HomelabUser.ps1 -FirstName "Thabo" -LastName "Molefe" -OU "IT Department"
   ```

---

## Notes

- These scripts assume the domain is `homelab.local`.
- You need appropriate permissions (Domain Admin or equivalent).
- Always test in the lab before using similar scripts in a production environment.
