# Group Policy

## Overview

Group Policy is managed from **DC01** and applied to domain-joined clients (WIN10-01).

```
DC01
  ↓
Active Directory
  ↓
Group Policy
  ↓
WIN10-01
```

## Policies Implemented

### 1. Disable Command Prompt
- Successfully applied and tested on WIN10-01
- Demonstrates central policy enforcement from the Domain Controller

### 2. Mapped Network Drives

| Drive Letter | Purpose                  | Mapped via |
|--------------|--------------------------|------------|
| **Z:**       | IT Shared Drive          | Group Policy |
| **P:**       | File-server data access  | Group Policy |

Both drives appear on **WIN10-01** and provide access to resources on FS01.

#### Architecture
```
DC01
│
└── Group Policy
     │
     ▼
WIN10-01
│
├── Z:
└── P:
     │
     ▼
FS01
└── CompanyData
```

### Testing Performed
- Received Z: drive on WIN10-01
- Opened the share
- Created and saved a text file successfully
- Confirmed P: drive also appears and functions correctly
