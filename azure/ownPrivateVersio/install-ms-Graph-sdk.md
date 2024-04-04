# Installation Microsoft Graph & SDK (exception case)

Quite first time own laptop got the error and installation problem, former it.
Normally if following by this steps must be works, but sort of some it's about changes as few % does it work or not, if work once and straight (this feels weird)

https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0

## Powershell 7

at begin need to install PowerShell version 7, because it will give a compatibility, normally PowerShell versio minimum version is 5.1. (currently, last March 2024)..

```
PS C:\Users\Z> winget search Microsoft.PowerShell
Name               Id                           Version Source
---------------------------------------------------------------
PowerShell         Microsoft.PowerShell         7.4.1.0 winget
PowerShell Preview Microsoft.PowerShell.Preview 7.5.0.2 winget

PS C:\Users\Z> winget install --id Microsoft.PowerShell --source winget
Found PowerShell [Microsoft.PowerShell] Version 7.4.1.0
This application is licensed to you by its owner.
Microsoft is not responsible for, nor does it grant any licenses to, third-party packages.
Downloading https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/PowerShell-7.4.1-win-x64.msi
  ██████████████████████████████   103 MB /  103 MB
Successfully verified installer hash
Starting package install...
Successfully installed
![image](https://github.com/zircomars/365-microsoft-network/assets/61022230/94154aa0-9ed4-48aa-a8c9-338372b4e19e)
```

```
PS C:\Users\ZT> $psVersionTable

Name                           Value
----                           -----
PSVersion                      7.4.1
PSEdition                      Core
GitCommitId                    7.4.1
OS                             Microsoft Windows 10.0.22631
Platform                       Win32NT
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0

```

## steps and few errors

configuration steps `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

```
PS C:\Users\ZT> get-executionPolicy -list

Scope ExecutionPolicy
    ----- ---------------
MachinePolicy       Undefined
   UserPolicy       Undefined
      Process       Undefined
  CurrentUser    RemoteSigned
 LocalMachine    RemoteSigned
```

few some error and this same error gave me at Windows powershell

```
PS C:\Users\ZT> Install-Module Microsoft.Graph -Scope CurrentUser
WARNING: 'Microsoft.Graph' matched module 'Microsoft.Graph/2.16.0' from provider: 'PowerShellGet', repository 'PSGallery'.
Install-Package: Unable to install, multiple modules matched 'Microsoft.Graph'. Please specify an exact -Name and -RequiredVersion.

PS C:\Users\ZT> Install-Module Microsoft.Graph -Scope AllUsers   
Install-Module: Administrator rights are required to install modules in 'C:\Program Files\PowerShell\Modules'. Log on to the computer with an account that has Administrator rights, and then try again, or install 'C:\Users\ZT\Documents\PowerShell\Modules' by adding "-Scope CurrentUser" to your command. You can also try running the Windows PowerShell session with elevated rights (Run as Administrator).

<this folder is empty>

PS C:\Users\ZT> Get-InstalledModule Microsoft.Graph
Get-Package: No match was found for the specified search criteria and module names 'Microsoft.Graph'.

PS C:\Users\ZT> Get-InstalledModule
PS C:\Users\ZT>
```


```
PS C:\WINDOWS\system32> Install-Module Microsoft.Graph -Scope AllUsers
WARNING: 'Microsoft.Graph' matched module 'Microsoft.Graph/2.16.0' from provider: 'PowerShellGet', repository
'PSGallery'.
WARNING: 'Microsoft.Graph' matched module 'Microsoft.Graph/2.16.0' from provider: 'PowerShellGet', repository
'PSGalleryInt'.
PackageManagement\Install-Package : Unable to install, multiple modules matched 'Microsoft.Graph'. Please specify a
single -Repository.
At C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PSModule.psm1:1809 char:21
+ ...          $null = PackageManagement\Install-Package @PSBoundParameters
+                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (Microsoft.Power....InstallPackage:InstallPackage) [Install-Package], E
   xception
    + FullyQualifiedErrorId : DisambiguateForInstall,Microsoft.PowerShell.PackageManagement.Cmdlets.InstallPackage

```

## so.. what was solution?

Solution there was copilot ai (microsft) gave me command try to install by using this command; <br> 
`Install-Module -Name Microsoft.Graph -requiredVersion 2.16.0 -Repository PSGallery -Scope AllUsers`

Just open Windows PowerShell (administrator), which input this command, then it will install the Microsoft Graph modules (just it gave me suprised), but it's better to ask Microsoft support and good change ask ChatGPT, Microsoft Copilot (AI) and other AI tools. Whole modules take/took probably couple/few 2-3 Gigabytes (Giga memory from the device memory)

after install, it's better try closed vscode application and open again as restart the vscode application. Then check and try login to Microsoft path by this command
- `connect-MgGraph -Scopes "Group.ReadWrite.All", "User.Read.All"`
- `Connect-MgGraph -Scopes "User.Read.All", "Group.ReadWrite.All"`
- `Connect-MgGraph -ContextScope Process`
- `connect-graph -Scopes User.Read.All, Organization.Read.All`

there other command same method can login, give and receive the Microsoft Graph permissions (if is global admin role / permissions). It normally popup the new web tab websites and input/write the admin account, type password and normal authentication method as app or send sms.

## other command checks

Check the and pass command get the permissions required

```
PS C:\Users\ZT> Find-MgGraphCommand -command Get-MgUser | Select -First 1 -ExpandProperty Permissions

Name                                         IsAdmin Description                                                       FullDescription
----                                         ------- -----------                                                       ---------------
DeviceManagementApps.Read.All                False   Read Microsoft Intune apps                                        Allows the app …
DeviceManagementApps.ReadWrite.All           True    Read and write Microsoft Intune apps                              Allows the app …
DeviceManagementConfiguration.Read.All       False   Read Microsoft Intune device configuration and policies           Allows the app …
DeviceManagementConfiguration.ReadWrite.All  False   Read and write Microsoft Intune device configuration and policies Allows the app …
DeviceManagementManagedDevices.Read.All      True    Read devices Microsoft Intune devices                             Allows the app …
DeviceManagementManagedDevices.ReadWrite.All True    Read and write Microsoft Intune devices                           Allows the app …
DeviceManagementServiceConfig.Read.All       True    Read Microsoft Intune configuration                               Allows the app …
DeviceManagementServiceConfig.ReadWrite.All  True    Read and write Microsoft Intune configuration                     Allows the app …
Directory.Read.All                           True    Read directory data                                               Allows the app …
Directory.ReadWrite.All                      False   Read and write directory data                                     Allows the app …
User.Read                                    False   Sign you in and read your profile                                 Allows you to s…
User.Read.All                                False   Read all users' full profiles                                     Allows the app …
User.ReadBasic.All                           False   Read all users' basic profiles                                    Allows the app …
User.ReadWrite                               False   Read and update your profile                                      Allows the app …
User.ReadWrite.All                           False   Read and write all users' full profiles                           Allows the app …

```

check own permissions like what permission got like read Azure's all groups at terminal show id, read all users, all enterprise application and ect.

```
PS C:\Users\ZT> (Get-MgContext).Scopes
Application.Read.All
Application.ReadWrite.All
AppRoleAssignment.ReadWrite.All
AuditLog.Read.All
Calendars.ReadWrite
Group.Read.All
Group.ReadWrite.All
Mail.Send
openid
Organization.Read.All
profile
User.Read
User.Read.All
User.ReadBasic.All
email
```













