# small note as cheat sheets

# before manage Exchange, Sharepoint, etc. you must first connect with AZURE AD:

# open powershell (without admin version is fine);
# Run, this command and enter Global Admin username/password
$ Connect-MsolService 

####### other manage microsoft/azure environment softwares/applications;
# Exchange Online: 
$ Connect-ExchangeOnline -UserPrincipalName 365admin@domain.com -ShowProgress $true

# Sharepoint Online: 
$ Connect-SPOService -Url https://$orgName-admin.sharepoint.com

# Security & Compliance Center: 
$ Connect-IPPSSession -UserPrincipalName 365admin@domain.com

# Teams & Skype for Business: 
$ Connect-MicrosoftTeams




