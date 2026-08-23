<#
.SYNOPSIS
    Creates a new Organizational Unit in the homelab.local domain.

.EXAMPLE
    .\New-HomelabOU.ps1 -OUName "Finance"
    .\New-HomelabOU.ps1 -OUName "Sales" -Description "Sales Department"
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$OUName,

    [Parameter(Mandatory = $false)]
    [string]$Description = ""
)

$Path = "DC=homelab,DC=local"

Write-Host "Creating Organizational Unit: $OUName" -ForegroundColor Cyan

try {
    New-ADOrganizationalUnit `
        -Name $OUName `
        -Path $Path `
        -Description $Description `
        -ProtectedFromAccidentalDeletion $true `
        -PassThru

    Write-Host "`nOU '$OUName' created successfully under $Path" -ForegroundColor Green
}
catch {
    Write-Host "Error: $_" -ForegroundColor Red
}
