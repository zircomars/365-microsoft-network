# Powershell

Usually if got Windows Pro it probably need to install latest or some module, but just in case check google and what it gives. Some command give an one line and that's all up, but anyway there might be need some update/upgrade commands.

this is just in case install and repository module. after install, when restart the powershell terminal (shut down the terminal) and open again, then is ready connect to azure by this command `$Connect-AzureAD` and it will give MFA (app notification) just in case.

Currently Microsoft when create new admin to orgization in the tenant host, and login first time basic give a new password like resetit and it will ask/suggest user perform mfa authentication for phone authentication. Because safe, if do not want use phone receive text messages.

also this installation module might takes for laptop few MB, so small warning and there must be enough spaces for the disk/RAM memories. ANd if like using vs code that also work.

```
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows
PS C:\WINDOWS\system32> Install-Module -Name AzureAD -Repository PSGallery

Untrusted repository
You are installing the modules from an untrusted repository. If you trust this repository, change its
InstallationPolicy value by running the Set-PSRepository cmdlet. Are you sure you want to install the modules from
'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): y
PS C:\WINDOWS\system32> Connect-AzureAD
WARNING: Install the latest PowerShell module, the Microsoft Graph PowerShell SDK, for new features and improvements!
https://aka.ms/graphPSmigration

Account                                     Environment TenantId                             TenantDomain
-------                                     ----------- --------                             ------------
```

this is normal configurateion and install module azure package.
```
PS C:\Windows\system32> Install-Module AzureAD 
PS C:\Windows\system32> Connect-AzureAD

Account             Environment TenantId                             TenantDomain              AccountType
-------             ----------- --------                             ------------              -----------
```

## first test

```
PS C:\WINDOWS\system32> Get-AzureADUser -ObjectId name.admin@domainName.onmicrosoft.com | select *


ExtensionProperty              : {[odata.metadata, https://graph.windows.net/1234-f0ec-qwe4qw-8834-asdfsad/$meta
                                 data#directoryObjects/@Element], [odata.type, Microsoft.DirectoryServices.User],
                                 [createdDateTime, 2/23/2024 6:48:22 PM], [employeeId, ]...}
DeletionTimestamp              :
ObjectId                       : f3c9a9c6-2ceb-4955-8453-9044c0c1501c
ObjectType                     : User
AccountEnabled                 : True
AgeGroup                       :
AssignedLicenses               : {}
AssignedPlans                  : {}
City                           :
CompanyName                    :
ConsentProvidedForMinor        :
Country                        :
CreationType                   :
Department                     :
DirSyncEnabled                 :
DisplayName                    : admin admin
FacsimileTelephoneNumber       :
GivenName                      : admin
IsCompromised                  :
ImmutableId                    :
JobTitle                       :
LastDirSyncTime                :
LegalAgeGroupClassification    :
Mail                           :
MailNickName                   : first.last
Mobile                         :
OnPremisesSecurityIdentifier   :
OtherMails                     : {}
PasswordPolicies               :
PasswordProfile                :
PhysicalDeliveryOfficeName     :
PostalCode                     :
PreferredLanguage              :
ProvisionedPlans               : {}
ProvisioningErrors             : {}
ProxyAddresses                 : {}
RefreshTokensValidFromDateTime : 2/23/2024 6:50:04 PM
ShowInAddressList              :
SignInNames                    : {}
SipProxyAddress                :
State                          :
StreetAddress                  :
Surname                        : admin
TelephoneNumber                :
UsageLocation                  :
UserPrincipalName              : name.admin@domainName.onmicrosoft.com
UserState                      :
UserStateChangedOn             :
UserType                       : Member

```

at least is real version 
```
PS C:\WINDOWS\system32> $PSVersionTable

Name                           Value
----                           -----
PSVersion                      5.1.22621.2506
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.22621.2506
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
```
disconnection `Disconnect-AzureAD` which is like log out from Azure AD






