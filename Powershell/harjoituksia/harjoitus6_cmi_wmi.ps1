#CIM and WMI 

#common information model
#windows management instrumentation

#hallinta informaatiota, eniten käytettään kun kysyttään laiteesta kuin windows laiteesta
#ohjelmat esim system eneter, simiäja tukee wmi, mutta komennossa on erot. snmp ne toteutukset wmi pohjaisia ja käytettään muualla esim. group policy sek ä wmi filtteri

#tarkistaa ominaisuuksia että  onko riittävästi muistia ennen kuin suorittaa sen toiminnan ja prosessin 
#wmi kautta pääsee erilaisiin asioihin ja ehkä jopa monimutkainen kyselly, että riippuuu mitä haetaan ja vaaditaan perustietoa

wmi console 
$wmic - ehkä pian poistumassa 
wmic:root\cli>


# login admin powershell
PS C:\WINDOWS\system32> wmic
wmic:root\cli>CPU
AddressWidth  Architecture  AssetTag                Availability  Caption                                 Characteristics  ConfigManagerErrorCode  ConfigManagerUserConfig  CpuStatus  CreationClassName  CurrentClockSpeed  CurrentVoltage  DataWidth  Description                             DeviceID  ErrorCleared  ErrorDescription  ExtClock  Family  InstallDate  L2CacheSize  L2CacheSpeed  L3CacheSize  L3CacheSpeed  LastErrorCode  Level  LoadPercentage  Manufacturer  MaxClockSpeed  Name                                      NumberOfCores  NumberOfEnabledCore  NumberOfLogicalProcessors  OtherFamilyDescription  PartNumber              PNPDeviceID  PowerManagementCapabilities  PowerManagementSupported  ProcessorId       ProcessorType  Revision  Role  SecondLevelAddressTranslationExtensions  SerialNumber            SocketDesignation  Status  StatusInfo  Stepping  SystemCreationClassName  SystemName       ThreadCount  UniqueId  UpgradeMethod  Version  VirtualizationFirmwareEnabled  VMMonitorModeExtensions  VoltageCaps
64            9             To Be Filled By O.E.M.  3             Intel64 Family 6 Model 142 Stepping 12  252



PS C:\WINDOWS\system32> gcim win32_service | ? displayname -match 'server'

ProcessId Name        StartMode State   Status ExitCode
--------- ----        --------- -----   ------ --------
6624      VMwareHostd Auto      Running OK     0


PS C:\WINDOWS\system32> gcim win32_service | ? name -eq 'bits'

ProcessId Name StartMode State   Status ExitCode
--------- ---- --------- -----   ------ --------
11492     BITS Auto      Running OK     0


PS C:\WINDOWS\system32> $class = Get-Cimclass -ClassName win32_logicaldisk
PS C:\WINDOWS\system32> $class.CimClassMethods

Name               ReturnType Parameters                                                        Qualifiers
----               ---------- ----------                                                        ----------
SetPowerState          UInt32 {PowerState, Time}                                                {}
Reset                  UInt32 {}                                                                {}
Chkdsk                 UInt32 {FixErrors, ForceDismount, OkToRunAtBootUp, RecoverBadSectors...} {Implemented, Mappin...
ScheduleAutoChk        UInt32 {LogicalDisk}                                                     {Implemented, Mappin...
ExcludeFromAutochk     UInt32 {LogicalDisk}                                                     {Implemented, Mappin...


PS C:\WINDOWS\system32> Get-WmiObject win32_logicaldisk | Get-Member -MemberType methods

TypeName: System.Management.ManagementObject#root\cimv2\Win32_LogicalDisk

Name                MemberType   Definition
----                ----------   ----------
Chkdsk              Method       System.Management.ManagementBaseObject Chkdsk(System.Boolean FixErrors, System.Bool...
Reset               Method       System.Management.ManagementBaseObject Reset()
SetPowerState       Method       System.Management.ManagementBaseObject SetPowerState(System.UInt16 PowerState, Syst...
ConvertFromDateTime ScriptMethod System.Object ConvertFromDateTime();
ConvertToDateTime   ScriptMethod System.Object ConvertToDateTime();


PS C:\WINDOWS\system32> Get-CimInstance win32_logicaldisk | Get-Member -MemberType methods

TypeName: Microsoft.Management.Infrastructure.CimInstance#root/cimv2/Win32_LogicalDisk

Name                      MemberType Definition
----                      ---------- ----------
Clone                     Method     System.Object ICloneable.Clone()
Dispose                   Method     void Dispose(), void IDisposable.Dispose()
Equals                    Method     bool Equals(System.Object obj)
GetCimSessionComputerName Method     string GetCimSessionComputerName()
GetCimSessionInstanceId   Method     guid GetCimSessionInstanceId()
GetHashCode               Method     int GetHashCode()
GetObjectData             Method     void GetObjectData(System.Runtime.Serialization.SerializationInfo info, System....
GetType                   Method     type GetType()
ToString                  Method     string ToString()


PS C:\WINDOWS\system32> Get-CimInstance -ClassName win32_operatingsystem | Select-object *


Status                                    : OK
Name                                      : Microsoft Windows 10 Home|C:\WINDOWS|\Device\Harddisk0\Partition3
FreePhysicalMemory                        : 1234567
FreeSpaceInPagingFiles                    : 7654321
FreeVirtualMemory                         : 1122334
Caption                                   : Microsoft Windows 10 Home


PS C:\WINDOWS\system32> Get-CimInstance -ClassName win32_service -filter "startmode='auto' AND ` state <>'running'" | Select-Object -property Displayname

Displayname
-----------


PS C:\WINDOWS\system32> Get-Volume -DriveLetter C | Select-Object -Property DriveLetter,
>> FileSystemLabel,@{Name="SizeGB";Expression={$_.size/1gb -as [int]}},
>> @{Name="FreeGB";Expression={$_.SizeRemaining/1gb}}

DriveLetter FileSystemLabel SizeGB           FreeGB
----------- --------------- ------           ------
          C Windows-SSD        237 97,123456789


PS C:\WINDOWS\system32> Get-Ciminstance -Namespace root/SecurityCenter2 -ClassName AntiVirusProduct

displayName              : Windows Defender
instanceGuid             : {abcd-123F-gfh-ES57-adsfewqr}
pathToSignedProductExe   : windowsdefender://
pathToSignedReportingExe : %ProgramFiles%\Windows Defender\MsMpeng.exe
productState             : 497981
timestamp                : Tue, 03 Jan 2023 06:36:58 GMT
PSComputerName           :

PS C:\WINDOWS\system32> Get-CimInstance Win32_PerfFormattedData_PerfOS_System |
>> Select-Object -property File*,ProcessorQueueLength,Uptime


FileControlBytesPersec      : 20036020
FileControlOperationsPersec : 16767
FileDataOperationsPersec    : 867
FileReadBytesPersec         : 604690
FileReadOperationsPersec    : 518
FileWriteBytesPersec        : 104575
FileWriteOperationsPersec   : 349
ProcessorQueueLength        : 0
Uptime                      :


PS C:\WINDOWS\system32> Get-CimInstance Win32_PerfFormattedData_PerfOS_System |
>> Select-Object -property File*,ProcessorQueueLength,
>> @{Name="Uptime";Expression={New-TimeSpan -Seconds $_.systemuptime}}


FileControlBytesPersec      : 49214
FileControlOperationsPersec : 587
FileDataOperationsPersec    : 278
FileReadBytesPersec         : 53673
FileReadOperationsPersec    : 142
FileWriteBytesPersec        : 53627
FileWriteOperationsPersec   : 135
ProcessorQueueLength        : 1
Uptime                      : 05:57:04

#############
# Listing namespaces
PS C:\WINDOWS\system32> Get-WmiObject -Namespace root -List -Recurse | Select -Unique __NAMESPACE

__NAMESPACE
-----------
ROOT
ROOT\subscription
ROOT\DEFAULT
ROOT\CIMV2
ROOT\cimv2

#############
# CIM and WMI listing classes
PS C:\WINDOWS\system32> Get-WmiObject -Namespace root\cimv2 -List | Sort Name

   NameSpace: ROOT\cimv2

Name                                Methods              Properties
----                                -------              ----------
__AbsoluteTimerInstruction          {}                   {EventDateTime, SkipIfPassed, TimerId}
__ACE                               {}                   {AccessMask, AceFlags, AceType, GuidInheritedObjectType...}
__AggregateEvent                    {}                   {NumberOfEvents, Representative}
__ClassCreationEvent                {}                   {SECURITY_DESCRIPTOR, TargetClass, TIME_CREATED}

PS C:\WINDOWS\system32> Get-CimClass -Namespace root\CIMv2 | Sort CimClassName


   NameSpace: ROOT/cimv2

CimClassName                        CimClassMethods      CimClassProperties
------------                        ---------------      ------------------
__AbsoluteTimerInstruction          {}                   {SkipIfPassed, TimerId, EventDateTime}
__ACE                               {}                   {AccessMask, AceFlags, AceType, GuidInheritedObjectType...}
__AggregateEvent                    {}                   {NumberOfEvents, Representative}
__ClassCreationEvent                {}                   {SECURITY_DESCRIPTOR, TIME_CREATED, TargetClass}
__ClassDeletionEvent                {}                   {SECURITY_DESCRIPTOR, TIME_CREATED, TargetClass}



# Querying instance class name
PS C:\WINDOWS\system32> Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3"

DeviceID     : C:
DriveType    : 3
ProviderName :
FreeSpace    : 105234657891
Size         : 254798120097
VolumeName   : Windows-SSD


PS C:\WINDOWS\system32> Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"

DeviceID DriveType ProviderName VolumeName  Size         FreeSpace
-------- --------- ------------ ----------  ----         ---------
C:       3                      Windows-SSD 254798120097 105234657891


# using WGL ( vähä kuin njotain mysql select * from jotakin jotakin)
PS C:\WINDOWS\system32> Get-CimInstance -Query "SELECT * FROM Win32_LogicalDisk WHERE DriveType = 3"

DeviceID DriveType ProviderName VolumeName  Size         FreeSpace
-------- --------- ------------ ----------  ----         ---------
C:       3                      Windows-SSD 254798120097 105234657891


PS C:\WINDOWS\system32> Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk WHERE DriveType = 3"


DeviceID     : C:
DriveType    : 3
ProviderName :
FreeSpace    : 105234657891
Size         : 254798120097
VolumeName   : Windows-SSD

PS C:\WINDOWS\system32> Get-Service -DisplayName *server*

Status   Name               DisplayName
------   ----               -----------
Running  VMwareHostd        VMware Workstation Server


#wmi and cim hostname / koneen nimi tai sen id

#perus powershell admin:sta tai ihan tavallinenn powershell tai cmd:stä voi tarkistaa koneen hostname $hostname

PS C:\WINDOWS\system32> hostname
LAPTOP-idSomething


PS C:\WINDOWS\system32> Get-CimInstance Win32_ComputerSystem

Name             PrimaryOwnerName     Domain               TotalPhysicalMemory  Model               Manufacturer
----             ----------------     ------               -------------------  -----               ------------
LAPTOP-idSomething  zhao-96@hotmail.com  WORKGROUP            8464355328           81MU                LENOVO


#fyysisen koneen datat ja tiedot
PS C:\WINDOWS\system32> Get-CimInstance Win32_ComputerSystem | Format-List *


AdminPasswordStatus         : 0
BootupState                 : Normal boot
ChassisBootupState          : 3


PS C:\WINDOWS\system32> Get-CimInstance Win32_ComputerSystem | Format-List Cim*


CimClass              : root/cimv2:Win32_ComputerSystem
CimInstanceProperties : {Caption, Description, InstallDate, Name...}
CimSystemProperties   : Microsoft.Management.Infrastructure.CimSystemProperties



PS C:\WINDOWS\system32> Get-CimInstance Win32_ComputerSystem | Format-List d*


Description      : AT/AT COMPATIBLE
DaylightInEffect : False
DNSHostName      : LAPTOP-idSomething
Domain           : WORKGROUP
DomainRole       : 0



PS C:\WINDOWS\system32> Get-CimInstance Win32_ComputerSystem | Format-List d*,t*


Description         : AT/AT COMPATIBLE
DaylightInEffect    : False
DNSHostName         : LAPTOP-idSomething
Domain              : WORKGROUP
DomainRole          : 0
ThermalState        : 3
TotalPhysicalMemory : 8464355328









