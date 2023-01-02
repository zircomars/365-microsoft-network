#comparision  operators

PS C:\WINDOWS\system32> Get-Service |
>> Where Status -eq Running

output:
Status   Name               DisplayName
------   ----               -----------
Running  AarSvc_325f5       AarSvc_325f5
Running  AdobeARMservice    Adobe Acrobat Update Service
Running  AdskLicensingSe... Autodesk Desktop Licensing Servic



PS C:\WINDOWS\system32> Get-Process |
>> Where CPU -gt 20

output:

Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
-------  ------    -----      -----     ------     --  -- -----------
    479      14    15020      20760      24,64   3188   0 audiodg
    663      31     3236       6224      22,22    852   1 csrss
    488      17     4600      20328      38,27   2860   1 ctfmon


