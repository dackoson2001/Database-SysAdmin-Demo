# Server Setup PowerShell Script

# 1. Install Active Directory Domain Services (AD DS)
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# 2. Promote the server to a Domain Controller
$DomainName = "corp.local"
$SafeModeAdminPassword = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force

Install-ADDSForest `
    -DomainName $DomainName `
    -SafeModeAdministratorPassword $SafeModeAdminPassword `
    -InstallDNS `
    -Force

# 3. Install DNS Server Role (if not already installed)
Install-WindowsFeature -Name DNS -IncludeManagementTools

# 4. Configure Static IP Address (Replace with your network settings)
$InterfaceAlias = "Ethernet"
$StaticIP = "192.168.1.10"
$SubnetMask = "255.255.255.0"
$Gateway = "192.168.1.1"
$DNS = "192.168.1.10"  # Set DNS to the local domain controller

New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $StaticIP -PrefixLength 24 -DefaultGateway $Gateway
Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ServerAddresses $DNS

# 5. Configure Windows Firewall (Allow essential services)
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Allow remote desktop access
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Allow Active Directory Services (DNS, LDAP, etc.)
Enable-NetFirewallRule -DisplayGroup "Active Directory Domain Services"

# 6. Set Time Zone and NTP (Network Time Protocol) Server
$TimeZone = "UTC"
Set-TimeZone -Name $TimeZone
Add-WindowsFeature NtpClient
Set-Service w32time -StartupType Automatic
Restart-Service w32time

# 7. Install IIS Web Server (Optional: If this server will host web services)
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# 8. Install PowerShell Modules (for additional management tools)
Install-Module -Name Az -Force -AllowClobber
Install-Module -Name Microsoft.Graph -Force

# 9. Create a New Admin User (if needed)
$Username = "adminUser"
$Password = ConvertTo-SecureString "AdminP@ssword1" -AsPlainText -Force
New-LocalUser -Name $Username -Password $Password -FullName "Administrator" -Description "Admin User Account"
Add-LocalGroupMember -Group "Administrators" -Member $Username

# 10. Set Up Backup Schedule (Use Windows Backup for simplicity)
wbadmin enable backup -addtarget:$BackupDrive -schedule:01:00 -user:$BackupUser -password:$BackupPassword
