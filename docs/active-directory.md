# Active Directory Administration

## Structure

```
homelab.local
├── Domain Controllers
│   └── DC01
├── Organizational Units
│   └── IT Department
├── Users
│   └── IT Administrator account
└── Security Groups
    └── Domain Users
```

## Tasks Practised

| Task                          | Status |
|-------------------------------|--------|
| Creating Organizational Units | ✅     |
| Creating Users                | ✅     |
| Creating Security Groups      | ✅     |
| Password resets               | ✅     |
| Unlocking accounts            | ✅     |
| Account lockout testing       | ✅     |
| Logon-hour restrictions       | ✅     |
| Restricting computers a user can log onto | ✅ |
| Security group membership     | ✅     |

## Account Lockout Policy

**Configured & Tested:**
- 5 incorrect password attempts → Account lockout

**Recovery:**
1. Opened **Active Directory Users and Computers**
2. Located the locked account
3. Unlocked the account
4. Confirmed the user could successfully log in again

This demonstrated real-world identity administration and policy enforcement.
