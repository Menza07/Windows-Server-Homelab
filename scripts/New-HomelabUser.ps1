<#
.SYNOPSIS
    Creates a new Active Directory user in the homelab.local domain.

.DESCRIPTION
    Simple script to create a user account, set a temporary password,
    and optionally place the user in a specific Organizational Unit.

.EXAMPLE
    .\New-HomelabUser.ps1 -FirstName "Thabo" -LastName "Molefe" -OU "IT Department"

.NOTES
    Run this script on DC01 (or a machine with RSAT / AD module) while logged in as Domain Admin.
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$FirstName,

    [Parameter(Mandatory = $true)]
    [string]$LastName,

    [Parameter(Mandatory = $false)]
    [string]$OU = "IT Department",   # Default OU

    [Parameter(Mandatory = $false)]
    [string]$Password = "P@ssw0rd123!"  # Temporary password – change after first login
)

# Build the username and display name
$SamAccountName = ($FirstName.Substring(0,1) + $LastName).ToLower()
$DisplayName    = "$FirstName $LastName"
$UserPrincipalName = "$SamAccountName@homelab.local"

# Path to the OU
$OUPath = "OU=$OU,DC=homelab,DC=local"

Write-Host "Creating user: $DisplayName ($SamAccountName)" -ForegroundColor Cyan

try {
    # Convert password to SecureString
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force

    # Create the user
    New-ADUser `
        -Name $DisplayName `
        -GivenName $FirstName `
        -Surname $LastName `
        -SamAccountName $SamAccountName `
        -UserPrincipalName $UserPrincipalName `
        -Path $OUPath `
        -AccountPassword $SecurePassword `
        -Enabled $true `
        -ChangePasswordAtLogon $true `
        -PassThru

    Write-Host "`nUser created successfully!" -ForegroundColor Green
    Write-Host "Username : $SamAccountName"
    Write-Host "UPN      : $UserPrincipalName"
    Write-Host "OU       : $OU"
    Write-Host "Temp Password: $Password  (user must change at next logon)" -ForegroundColor Yellow
}
catch {
    Write-Host "Error creating user: $_" -ForegroundColor Red
}
