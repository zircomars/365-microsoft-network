# First installation MS graph sdk

Tutorial video; https://www.youtube.com/watch?v=oilylijvbic
or learn https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0
whole video tutorials and start, there might be missing something and might not updated 

```
PS C:\Users> winget search Microsoft.Powershell
The `msstore` source requires that you view the following agreements before using.
Terms of Transaction: https://aka.ms/microsoft-store-terms-of-transaction
The source requires the current machine's 2-letter geographic region to be sent to the backend service to function properly (ex. "US").

Do you agree to all the source agreements terms?
[Y] Yes  [N] No: y 
Name               Id                           Version Source
---------------------------------------------------------------
PowerShell         Microsoft.PowerShell         7.4.1.0 winget
PowerShell Preview Microsoft.PowerShell.Preview 7.5.0.1 winget
```

```
PS C:\Users> winget install --id Microsoft.Powershell --source winget
Found PowerShell [Microsoft.PowerShell] Version 7.4.1.0
This application is licensed to you by its owner.
Microsoft is not responsible for, nor does it grant any licenses to, third-party packages.
Downloading https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/PowerShell-7.4.1-win-x64.msi
  ██████████████████████████████   103 MB /  103 MB
Successfully verified installer hash
Starting package install...
Successfully installed
```

```
PS C:\Users> $PSVersionTable

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

bootattu vscode ja avaa (alhaalta + merkki ja powershell) ja tarkista, että versio on muuttunut ja oikea kategoria listasta tulee pwsh (powershell)

```
PS C:\Users\ZT> $PSVersionTable

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

set and install execution policy for current user
install current module and change the scope 

S `C:\Users\ZT> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
PS `C:\Users\ZT> Install-Module Microsoft.Graph -Scope CurrentUser`

```
Untrusted repository
You are installing the modules from an untrusted repository. If you trust this repository, change its InstallationPolicy value by running the 
Set-PSRepository cmdlet. Are you sure you want to install the modules from 'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): y
WARNING: Version '2.12.0' of module 'Microsoft.Graph' is already installed at 'C:\Program Files\WindowsPowerShell\Modules\Microsoft.Graph\2.12.0'. To install version '2.14.0', run Install-Module and add the -Force parameter, this command will install version '2.14.0' side-by-side with version '2.12.0'.
```

(hmm olen ladannut ennenkin vai..)

suoriti jotakin latausta ja puuttuvaa pakettia??
PS C:\Users\ZT> Install-Module microsoft.graph -Force

alkoi pelittää ja siinä oli jotakin,
now downloaded microsoft graph sdk files/modules and now can use mg command

```
Get-installedModule Microsoft.Graph  

Version              Name                                Repository           Description
-------              ----                                ----------           -----------
2.14.0               Microsoft.Graph                     PSGallery            Microsoft Graph PowerShell module
```

mg command meaning powersehell command will be "get-mg" like get-azureaduser and ect
get-mgprofile is not available after updating v2.1.0

still missing some packages / modules

```
PS C:\Users\ZT> Install-Module Microsoft.Graph.Beta -AllowClobber

Untrusted repository
You are installing the modules from an untrusted repository. If you trust this repository, change its InstallationPolicy value by running the        
Set-PSRepository cmdlet. Are you sure you want to install the modules from 'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): y
PS C:\Users\ZT> Get-Command Get-MgBetaUser

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-MgBetaUser                                     2.14.0     Microsoft.Graph.Beta.Users
```

same version...

```
PS C:\Users\ZT> Get-Command Get-MgUser     

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-MgUser                                         2.14.0     Microsoft.Graph.Users
```

## skipped this 

"Get-MgProfile" process

```
continue check something else, show permission and upgrade group and what is the group permission
Find-MgGraphCommand -command Get-MgGroup | Select -First 1 -ExpandProperty Permissions

Name                    IsAdmin Description                   FullDescription
----                    ------- -----------                   ---------------
Directory.Read.All      False   Read directory data           Allows the app to read data in your organization's directory, such as users, groups a… 
Directory.ReadWrite.All False   Read and write directory data Allows the app to read and write data in your organization's directory, such as users… 
Group.Read.All          False   Read all groups               Allows the app to read group properties and memberships, and read conversations for a… 
Group.ReadWrite.All     False   Read and write all groups     Allows the app to create groups, read all group properties and memberships, update gr… 
GroupMember.Read.All    False   Read all group memberships    Allows the app to read memberships and basic group properties for all groups without … 
```

another example get mgusers

```
PS C:\Users\ZT> Find-MgGraphCommand -command Get-MgUser | Select -First 1 -ExpandProperty Permissions

Name                                         IsAdmin Description                                                       FullDescription
----                                         ------- -----------                                                       ---------------
DeviceManagementApps.Read.All                False   Read Microsoft Intune apps                                        Allows the app to read the p…
DeviceManagementApps.ReadWrite.All           True    Read and write Microsoft Intune apps                              Allows the app to read and w…
DeviceManagementConfiguration.Read.All       False   Read Microsoft Intune device configuration and policies           Allows the app to read prope…
DeviceManagementConfiguration.ReadWrite.All  False   Read and write Microsoft Intune device configuration and policies Allows the app to read and w…
DeviceManagementManagedDevices.Read.All      True    Read devices Microsoft Intune devices                             Allows the app to read the p…
DeviceManagementManagedDevices.ReadWrite.All True    Read and write Microsoft Intune devices                           Allows the app to read and w…
DeviceManagementServiceConfig.Read.All       True    Read Microsoft Intune configuration                               Allows the app to read Micro… 
DeviceManagementServiceConfig.ReadWrite.All  True    Read and write Microsoft Intune configuration                     Allows the app to read and w… 
Directory.Read.All                           True    Read directory data                                               Allows the app to read data … 
Directory.ReadWrite.All                      False   Read and write directory data                                     Allows the app to read and w… 
User.Read                                    False   Sign you in and read your profile                                 Allows you to sign in to the… 
User.Read.All                                False   Read all users' full profiles                                     Allows the app to read user … 
User.ReadBasic.All                           False   Read all users' basic profiles                                    Allows the app to read a bas… 
User.ReadWrite                               False   Read and update your profile                                      Allows the app to read your … 
User.ReadWrite.All                           False   Read and write all users' full profiles   
```

now login, as got permission "user.read.all" this is important and got rights for the application powershell. 
!! the example the theory of lease permissions and granting rights to accomodate the tasks
s
let's try to connect to mg graph

it will ask user give an admin account or admin roles (permission) as global admin or another admin levels
so, as prompt log in to start the session
```
PS C:\Users\ZT> Connect-MgGraph -Scopes "Group.ReadWrite.All", "User.Read.All"
Welcome to Microsoft Graph!

Connected via delegated access using 14d82eec-204b-4c2f-b7e8-296a70dab67e
Readme: https://aka.ms/graph/sdk/powershell
SDK Docs: https://aka.ms/graph/sdk/powershell/docs
API Docs: https://aka.ms/graph/docs

NOTE: You can use the -NoWelcome parameter to suppress this message.
```
