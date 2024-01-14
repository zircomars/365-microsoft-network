# Nowadays everything is moving towards the cloud and to perform our tasks, you must connect 
# PowerShell to the online version of the application rather than using the on-premise one. 

# if start open powershell command, there is no need activade "admin" mode, just enough open the normal powershell command line application

# the module “Microsoft.PowerShell.Management” is installed on our machines which enables us to make use of cmdlets such as “Get-Service”, “Copy-Item”, “Get-EventLog”
$ Get-Module Microsoft.Powershell.Management

ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Manifest   3.1.0.0    Microsoft.PowerShell.Management     {Add-Computer, Add-Content, Checkpoint-Computer, Clear-Con...



$ Find-Module *exchangeonline*

Version    Name                                Repository           Description
-------    ----                                ----------           -----------
3.4.0      ExchangeOnlineManagement            PSGallery            This is a General Availability (GA) release of t...
0.2.17     BitTitan.Runbooks.ExchangeOnline    PSGallery            PowerShell module for common Exchange Online fun...
0.2.20     BitTitan.Runbooks.ExchangeOnline... PSGallery            PowerShell module for common Exchange Online fun...
0.6.1      ExchangeOnlineManagement.SAM        PSGallery            This module allows you to connect to the Exchang...
1.0.3      ExchangeOnlineArchiveTransfer       PSGallery            Copy or move items of a Exchange Online mailbox ...
3.4.0      ExchangeOnlineManagement            PSGalleryInt         This is a General Availability (GA) release of t...
0.2.17     BitTitan.Runbooks.ExchangeOnline    PSGalleryInt         PowerShell module for common Exchange Online fun...
0.2.20     BitTitan.Runbooks.ExchangeOnline... PSGalleryInt         PowerShell module for common Exchange Online fun...
0.6.1      ExchangeOnlineManagement.SAM        PSGalleryInt         This module allows you to connect to the Exchang...
1.0.3      ExchangeOnlineArchiveTransfer       PSGalleryInt         Copy or move items of a Exchange Online mailbox ...

$ find-module exchangeonline* | ft name,author

Name                          Author
----                          ------
ExchangeOnlineManagement      Microsoft Corporation
ExchangeOnlineManagement.SAM  Kelvin Tegelaar - Kelvin@limenetworks.nl
ExchangeOnlineArchiveTransfer Jamy Klotzsche
ExchangeOnlineManagement      Microsoft Corporation
ExchangeOnlineManagement.SAM  Kelvin Tegelaar - Kelvin@limenetworks.nl
ExchangeOnlineArchiveTransfer Jamy Klotzsche


###################
# CONNECT TO M365 (START HERE)

# if powershell missing module and need installation package for connect to Microsoft services and other environment tools as Active Directory, Exchange online and ect.

# cmdlet to install the Azure Active Directory PowerShell for Graph module
$ Install-Module -Name AzureAD

# Exchange Online Management Module
$ Install-Module -name ExchangOnlineManagement

#  SharePoint Online Management Shell
$ Install-Module -Name Microsoft.Online.SharePoint.PowerShell


# Microsoft TeamsModule & Teams monitoring
# Install-Module -Name MicrosoftTeams

##########
# after install if trying to connect to e.g. exchange online & it will pop up the small browser item , so input the M365 accounts to get connection like as data
$ Connect-ExchangeOnline






