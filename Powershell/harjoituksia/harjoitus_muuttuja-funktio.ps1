#muuttujia ja  funktioita

<#rajoitettu  istunnon aikana, että powershell scriptauksen aikana, kun sammutaa kerran powershell niin se istunnon scriptaukset poistuu tallenteesta

data sisältöä voi muokata lennosta #>

$<muuttujan_nimi>> voi ola myös objekti numeraallinen tai kirjain 

#$computer = jotakin jotakin 

PS C:\WINDOWS\system32>  $logFile = "demostraatio"
PS C:\WINDOWS\system32> $logFile.contains("demo")
True
PS C:\WINDOWS\system32> $logFile.ToUpper()
DEMOSTRAATIO
PS C:\WINDOWS\system32> $logFile.length
12
PS C:\WINDOWS\system32>

# kommentien pituus jos on tosi pitkä, että jopa pitää laittaa enter <# asdf #> vähä koodauski /**/
<# muuttujan nimi voi pitää sisältään välilyöntiä kyseisen erikoisenmerkiin, mutta yksinkertaisempi ja tunnistaa muuttuja ja generoida niitä, mutta ei kanata nimeä kirjain ja erikoismerkki yhteen

tietotyyppi automaatinenn, koska siellä on objekti mutta objekti viedään kommenolla sisään.

muuttujien pyörittäminen:
ei kovin usein ei pyöritä, mutta tietyissä komennossa ja mahdollista. ekaks pitää selvittä method ja ominaisuudet on käyttössä ja  tulee siitä datasta
#>

PS C:\WINDOWS\system32> $logFile.Insert(8, "\MyScript")
demostra\MyScriptatio
PS C:\WINDOWS\system32> $logFile.Split("\") | Select -Last 1
demostraatio
PS C:\WINDOWS\system32>

PS C:\WINDOWS\system32> $time = date
PS C:\WINDOWS\system32> $time
keskiviikko 4. tammikuuta 2023 19.36.09

PS C:\WINDOWS\system32> $time.AddDays(2)
perjantai 6. tammikuuta 2023 19.36.09

PS C:\WINDOWS\system32> $time.AddDays(-2)
maanantai 2. tammikuuta 2023 19.36.09

# array contain vähä kuin taulukko mikälie

PS C:\WINDOWS\system32> $computers = "LON-DC1","LON-SRV1","LON-CL1"
PS C:\WINDOWS\system32> $computers[2]
LON-CL1
PS C:\WINDOWS\system32> [System.Collections.ArrayList]$computers2 = "LON-DC1","LON-SRV1","LON-CL1"
PS C:\WINDOWS\system32> $computers2
LON-DC1
LON-SRV1
LON-CL1

PS C:\WINDOWS\system32> $computers2.Add("ASD-EF1")
3
#vähä kuin toistettaan sitä array taulukkoa, mitä siinä on
PS C:\WINDOWS\system32> $computers2
LON-DC1
LON-SRV1
LON-CL1
ASD-EF1

PS C:\WINDOWS\system32> $servers = @{"LON-DC1" = "172.16.0.10"; "LON-SRV1" = "172.16.0.11"}
PS C:\WINDOWS\system32> $servers

Name                           Value
----                           -----
LON-SRV1                       172.16.0.11
LON-DC1                        172.16.0.10


PS C:\WINDOWS\system32> $servers."LON-DC1"
172.16.0.10
PS C:\WINDOWS\system32> $servers["LON-DC1"]
172.16.0.10
PS C:\WINDOWS\system32> $servers.Add("LON-SRV2","172.16.0.12")
PS C:\WINDOWS\system32> $servers | Get-Member


   TypeName: System.Collections.Hashtable

Name              MemberType            Definition
----              ----------            ----------
Add               Method                void Add(System.Object key, System.Object value), void IDictionary.Add(System.Objec...
Clear             Method                void Clear(), void IDictionary.Clear()
Clone             Method                System.Object Clone(), System.Object ICloneable.Clone()
Contains          Method                bool Contains(System.Object key), bool IDictionary.Contains(System.Object key)
ContainsKey       Method                bool ContainsKey(System.Object key)
ContainsValue     Method                bool ContainsValue(System.Object value)
CopyTo            Method                void CopyTo(array array, int arrayIndex), void ICollection.CopyTo(array array, int ...
Equals            Method                bool Equals(System.Object obj)
GetEnumerator     Method                System.Collections.IDictionaryEnumerator GetEnumerator(), System.Collections.IDicti...
GetHashCode       Method                int GetHashCode()
GetObjectData     Method                void GetObjectData(System.Runtime.Serialization.SerializationInfo info, System.Runt...
GetType           Method                type GetType()
OnDeserialization Method                void OnDeserialization(System.Object sender), void IDeserializationCallback.OnDeser...
Remove            Method                void Remove(System.Object key), void IDictionary.Remove(System.Object key)
ToString          Method                string ToString()
Item              ParameterizedProperty System.Object Item(System.Object key) {get;set;}
Count             Property              int Count {get;}
IsFixedSize       Property              bool IsFixedSize {get;}
IsReadOnly        Property              bool IsReadOnly {get;}
IsSynchronized    Property              bool IsSynchronized {get;}
Keys              Property              System.Collections.ICollection Keys {get;}
SyncRoot          Property              System.Object SyncRoot {get;}
Values            Property              System.Collections.ICollection Values {get;}


PS C:\WINDOWS\system32> $servers.contains("LON-DC1")
True
PS C:\WINDOWS\system32> $servers.containsvalue("172.16.0.12")
True

PS C:\WINDOWS\system32> $prop = @{n="Size(KB)";e={$_.Length/1KB}}
PS C:\WINDOWS\system32> $prop

Name                           Value
----                           -----
n                              Size(KB)
e                              $_.Length/1KB




