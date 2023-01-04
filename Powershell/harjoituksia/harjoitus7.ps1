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