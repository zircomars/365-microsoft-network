# https://learn.microsoft.com/en-us/powershell/scripting/developer/module/understanding-a-windows-powershell-module?view=powershell-7.3
<# tiedosto tyyppi  powershell ps1 ja psm1

PowerShell Module (.psm1) & PowerShell script (.ps1)

psm1 - joka sisältää  minkä tahansa kelvollisen windows powershell koodi. Scriptauksen kehittäjä ja admin valvojat voi käyttää tämän tyyppistä moduulia luodakseen lisää moduulia,  joiden jäsenset sisältävät toimintoja, muuttujia ja muuta.
Komento moduuli  on yksinkertainen windows powershell komentosarja, jolla on eri laajennuksia,  jonka avulla voi  admin valvoja voi käyttää tuonti-, vientiin- ja hallintatoimintoon.

Lopuksi, komentosarjamoduuli, kuten kaikki muutkin moduulit, joita ei luoda dynaamisesti, on tallennettava kansioon, jonka PowerShell voi kohtuudella löytää. Yleensä tämä on PowerShell-moduulin polulla; mutta tarvittaessa voit kuvata tarkasti, mihin moduulisi on asennettu.

#>

####################
# ensimmäinen psm1 script

simple.psm1
$testi = "missä minun kahvi on?"

# kun avaa admin tai tavallisen powershell, ja yritettään toistaa psm1 sisisen tekstin eli missä minun kahvi on? 
# niin se ei toistu, mutta yhtäkkiä avaa sen txt tiedostona & eli tiedoston lataaminen
PS C:\Users\Name\Documents> .\simple.psm1

###########
#scriptaus osuus

# kun alkaa luoda jokin scriptauksen osuuden eli joko copy-paste tai tyhjin käsin  niin tulee tallentaa tiedosto niin powershell tukee .ps1 , .psd1 , psm1 ja jne, että powershell komento ymmärtää mitä hakee (ainakn melkee), mutta pitää olla tarkanan kommenon polun ja tiedoston kanssa
