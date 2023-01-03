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


# pipeline object 
# pipelien tarkoittaa putki tai tommoinen | 

#komento lyödään powershell, sillo ollaan Pipeline kuvitteelinen putki, joka kuvaa kommenon suoritusta. putken vasemsta sorvutaan objekteja sisään ja putken oikeast pätkästä muokattuja (ei aina). 
#useampi kommenotja objektejä mm. filteröinti, muokkausta, mittaamisesta, sorttausta, laskemista ja yms. voidaan tuottaa näkymä näillä format komennolla. periaatteessa tapahtuu putken sisällä.

#yleinen Pipeline kommennot on get |set, get ja jne. 

PS C:\WINDOWS\system32> 'BITS','WinRM' | Get-Service

Status   Name               DisplayName
------   ----               -----------
Stopped  BITS               BITS (Background Intelligent Transf...
Stopped  WinRM              Windowsin etähallinta (WS-Management)


PS C:\WINDOWS\system32> "BITS","WinRM" | Get-Member


   TypeName: System.String

Name             MemberType            Definition
----             ----------            ----------
Clone            Method                System.Object Clone(), System.Object ICloneable.Clone()
CompareTo        Method                int CompareTo(System.Object value), int CompareTo(string strB), int IComparab...
Contains         Method                bool Contains(string value)
CopyTo           Method                void CopyTo(int sourceIndex, char[] destination, int destinationIndex, int co...
EndsWith         Method                bool EndsWith(string value), bool EndsWith(string value, System.StringCompari...
Equals           Method                bool Equals(System.Object obj), bool Equals(string value), bool Equals(string...
GetEnumerator    Method                System.CharEnumerator GetEnumerator(), System.Collections.IEnumerator IEnumer...
GetHashCode      Method                int GetHashCode()
GetType          Method                type GetType()