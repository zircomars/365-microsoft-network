

PS C:\WINDOWS\system32> $h = @{
>> Computername = $env:computername
>> PSVersion = $PSVersionTable.PSVersion
>> Date = (Get-Date).ToShortDateString()
>> }
PS C:\WINDOWS\system32> $h

Name                           Value
----                           -----
Date                           3.1.2023
Computername                   LAPTOP-<id_name>
PSVersion                      5.1.19041.2364


PS C:\WINDOWS\system32> $h.add("Name",@("Bits","WinRM"))
PS C:\WINDOWS\system32> $h.Remove("date")
PS C:\WINDOWS\system32> $h.remove("psversion")
PS C:\WINDOWS\system32> Get-Service @h

Status   Name               DisplayName
------   ----               -----------
Stopped  Bits               BITS (Background Intelligent Transf...
Stopped  WinRM              Windowsin etähallinta (WS-Management)


PS C:\WINDOWS\system32> $h = [ordered]@{
>> Computername = $env:computername
>> Services = (Get-Service | Where-Object {$_.status -eq 'running'})
>> Processes = (Get-Process | Sort-object -Property WS -Descending |
>> Select-object -first 5)
>> TempSize = (Get-ChildItem -Path $env:temp -file -Recurse |
>> Measure-object -Property length -sum).sum
>> }
PS C:\WINDOWS\system32> New-Object -TypeName PSObject -Property $h

Computername    Services                                                             Processes
------------    --------                                                             ---------
LAPTOP-<id_name> {AarSvc_8f796, AdobeARMservice, AdskLicensingService, AGMService...} {System.Diagnostics.Process (ms...


PS C:\WINDOWS\system32> Get-Eventlog -list -computername $env:computername |
>> Where-Object {$_.entries.count -gt 0} |
>> Select-Object -Property Log,MaximumKilobytes,
>> @{Name="Entries";Expression={$_.entries.count}},
>> @{Name="Computername";Expression={$_.machinename}}

Log                MaximumKilobytes Entries Computername
---                ---------------- ------- ------------
Application                   20480     218 LAPTOP-<id_name>
OAlerts                         128      38 LAPTOP-<id_name>
OneApp_IGCC                     512       6 LAPTOP-<id_name>
Security                      20480   33057 LAPTOP-<id_name>
System                        20480   35555 LAPTOP-<id_name>
Windows PowerShell            15360   11994 LAPTOP-<id_name>


PS C:\WINDOWS\system32> Get-ChildItem $env:temp -file -Recurse |
>> Group-Object -Property extension |
>> Select-Object Name,Count,
>> @{Name="Size";Expression={($_.group |
>> measure-object -Property length -sum).sum}}

Name  Count    Size
----  -----    ----
.ses      1      53
.tmp      9 5984025
.etl      7  405504
.png    154  954014
.log     19 8824637
.dat      4       0
.dll      3  534024
.x        2       0
          3    2958
.BLOB     2  211552
.MAP      2    8735

#random luku, että count tulostaa kaksi kertaa
PS C:\WINDOWS\system32> $arr = "a","b","c","d","e"
PS C:\WINDOWS\system32> $x = $arr | Get-Random -Count 2
PS C:\WINDOWS\system32> Switch ($x) {
>> "a" { "alpha" }
>> "b" { "bravo" }
>> "c" { "charlie" }
>> "d" { "delta" }
>> "e" { "echo" }
>> }
charlie

#teksti käänteisenä/peilikuvana
PS C:\WINDOWS\system32> $text = "PowerShell Forever"
PS C:\WINDOWS\system32> $arr = $text.ToCharArray()
PS C:\WINDOWS\system32> $arr[$($text.length)..0] -join ""
reveroF llehSrewoP


PS C:\WINDOWS\system32> $h = Get-Service | group-object starttype -AsHashTable -AsString
PS C:\WINDOWS\system32> $h

Name                           Value
----                           -----
Manual                         {AarSvc_8f796, AJRouter, ALG, AppIDSvc...}
Automatic                      {AdobeARMservice, AdskLicensingService, AGMService, AGSService...}
Disabled                       {NetTcpPortSharing, RemoteAccess, RemoteRegistry, shpamsvc...}


PS C:\WINDOWS\system32> $h.Disabled[-1].DisplayName
Microsoft Update Health Service


PS C:\WINDOWS\system32> 10..100 | Get-Random -Count 25 | foreach-object { $_ * 3 } |
>> Measure-Object -sum -Average -Maximum -Minimum

Count    : 25
Average  : 166,68
Sum      : 4167
Maximum  : 300
Minimum  : 33
Property :

#hakee edellisiä kommentoja historian aikana, eli kaikki mitä on näppytetty powershell admin istunnon aikana
PS C:\WINDOWS\system32> Get-History | Where-Object {$_.commandline -notmatch "help"} |
>> Sort Commandline | foreach-object {$_.CommandLine.ToLower() } | Get-Unique

#hakee edellisiä kommentoja historian aikana, sama methodi ja vaihtoehtoinen komento
(Get-History).CommandLine.ToLower() |
where-object {$_ -notmatch "help"} |
Sort-Object | Get-Unique

#hakee edellisiä kommentoja historian aikana, sama methodi ja vaihtoehtoinen komento
(Get-History).where({$_.commandline -notmatch "help"}).Commandline.toLower() |
Sort-Object | Get-Unique



############################################################################################################

## Exploring the certificate provider ##

PS C:\WINDOWS\system32> Get-ChildItem | Get-Member | Where-Object {$_.membertype -eq "property"}


   TypeName: System.IO.DirectoryInfo

Name              MemberType Definition
----              ---------- ----------
Attributes        Property   System.IO.FileAttributes Attributes {get;set;}
CreationTime      Property   datetime CreationTime {get;set;}


PS C:\WINDOWS\system32> Get-PSDrive | where name -like "c*"

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                 139,38         75,41 FileSystem    C:\                                               WINDOWS\system32
Cert                                   Certificate   \


PS C:\WINDOWS\system32> Set-Location cert:\
PS Cert:\> GCI


Location   : CurrentUser
StoreNames : {TrustedPublisher, ClientAuthIssuer, ISG Trust, Root...}

Location   : LocalMachine
StoreNames : {TestSignRoot, ClientAuthIssuer, Remote Desktop, Root...}


#tulostuu aika pitkä listaus katkaise välissä eli ctrl + c
PS Cert:\> GCI -Recurse
Location   : CurrentUser
StoreNames : {TrustedPublisher, ClientAuthIssuer, ISG Trust, Root...}

Name : TrustedPublisher

Subject      : CN=Oracle Corporation, OU=Virtualbox, O=Oracle Corporation, L=Redwood Shores, S=CA, C=US
Issuer       : CN=DigiCert Assured ID Code Signing CA-1, OU=www.digicert.com, O=DigiCert Inc, C=US
Thumbprint   : 6F474206BCBB391BB82BA9E5DC0302DEF37AEBBE
FriendlyName :
NotBefore    : 19.3.2019 2.00.00
NotAfter     : 23.3.2022 14.00.00
Extensions   : {System.Security.Cryptography.Oid, System.Security.Cryptography.Oid, System.Security.Cryptography.Oid, S
               ystem.Security.Cryptography.Oid...}


#avaa txt ja käskee lopettaa, että tallenettaanko johonkin
PS Cert:\> GCI -Recurse > C:\a.txt; notepad.exe a.txt

####################################################################################

# Examining the environment provider ##

PS C:\WINDOWS\system32> New-PSDrive -Name al -PSProvider alias -Root .

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
al                                     Alias         .


PS C:\WINDOWS\system32> SL al:\
PS al:\> GCI | Sort -Property name

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           % -> ForEach-Object
Alias           ? -> Where-Object



PS al:\> GCI | Sort -Property name | Where Name -gt "t"

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           tee -> Tee-Object
Alias           trcm -> Trace-Command
Alias           type -> Get-Content
Alias           wget -> Invoke-WebRequest
Alias           where -> Where-Object
Alias           wjb -> Wait-Job
Alias           write -> Write-Output

PS al:\> SL C:\
PS C:\> Remove-PSDrive al
PS C:\> Get-PSDrive

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
Alias                                  Alias
C                 139,38         83,25 FileSystem    C:\
Cert                                   Certificate   \
Env                                    Environment
Function                               Function
HKCU                                   Registry      HKEY_CURRENT_USER
HKLM                                   Registry      HKEY_LOCAL_MACHINE
Variable                               Variable
WSMan                                  WSMan

# user computer data,  hostname, local app data and ect..
PS C:\>
PS C:\> Get-Item -Path env:\

Name                           Value
----                           -----

# input public key token = abcd1234
PS C:\> Get-Item -path env:\ | Get-Member

Name           MemberType   Definition
----           ----------   ----------
Add            Method       void ICollection[DictionaryEntry].Add(System.Collections.DictionaryEntry item)
Clear          Method       void ICollection[DictionaryEntry].Clear()


PS C:\> $objEnv=Get-Item -Path env:\
PS C:\> $objEnv.Count
41
PS C:\> $objEnv.Get_count

OverloadDefinitions
-------------------
int get_Count()
int ICollection[DictionaryEntry].get_Count()
int ICollection.get_Count()
int IReadOnlyCollection[DictionaryEntry].get_Count()



PS C:\> $objEnv.Get_count()
41
PS C:\> $objEnv.GetType()

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
False    True     ValueCollection                          System.Object














