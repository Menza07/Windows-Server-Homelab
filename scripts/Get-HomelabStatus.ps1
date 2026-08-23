<#
.SYNOPSIS
    Quick health-check script for the homelab.local environment.

.DESCRIPTION
    Checks key services on DC01 and basic connectivity.
    Run this from DC01 or any domain-joined machine with the AD PowerShell module.

.EXAMPLE
    .\Get-HomelabStatus.ps1
#>

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Homelab.local Status Check" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. Domain Controller info
Write-Host "[1] Domain Controller" -ForegroundColor Yellow
try {
    $DC = Get-ADDomainController -Discover
    Write-Host "    Name     : $($DC.Name)" -ForegroundColor Green
    Write-Host "    Domain   : $($DC.Domain)" -ForegroundColor Green
    Write-Host "    IP       : $($DC.IPv4Address)" -ForegroundColor Green
    Write-Host "    Site     : $($DC.Site)" -ForegroundColor Green
}
catch {
    Write-Host "    Could not retrieve Domain Controller info" -ForegroundColor Red
}

Write-Host ""

# 2. Check critical services on local machine (best run on DC01)
Write-Host "[2] Critical Services (local machine)" -ForegroundColor Yellow
$Services = @("NTDS", "DNS", "DHCPServer", "Netlogon")
foreach ($svc in $Services) {
    $status = Get-Service -Name $svc -ErrorAction SilentlyContinue
    if ($status) {
        $color = if ($status.Status -eq "Running") { "Green" } else { "Red" }
        Write-Host ("    {0,-15} : {1}" -f $svc, $status.Status) -ForegroundColor $color
    }
    else {
        Write-Host ("    {0,-15} : Not found on this machine" -f $svc) -ForegroundColor DarkGray
    }
}

Write-Host ""

# 3. DNS test
Write-Host "[3] DNS Resolution Test" -ForegroundColor Yellow
try {
    $dns = Resolve-DnsName -Name "homelab.local" -ErrorAction Stop
    Write-Host "    homelab.local resolves to: $($dns.IPAddress)" -ForegroundColor Green
}
catch {
    Write-Host "    Failed to resolve homelab.local" -ForegroundColor Red
}

Write-Host ""

# 4. Quick AD user count
Write-Host "[4] Active Directory Summary" -ForegroundColor Yellow
try {
    $userCount = (Get-ADUser -Filter *).Count
    $ouCount   = (Get-ADOrganizationalUnit -Filter *).Count
    $groupCount = (Get-ADGroup -Filter *).Count
    Write-Host "    Users  : $userCount" -ForegroundColor Green
    Write-Host "    OUs    : $ouCount" -ForegroundColor Green
    Write-Host "    Groups : $groupCount" -ForegroundColor Green
}
catch {
    Write-Host "    Could not query Active Directory" -ForegroundColor Red
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Check completed: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
