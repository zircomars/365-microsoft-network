# scriptausta

# usein käytettään powershell kommentoa, mutta perus toistettaan scriptausta ja siinä vaadittaan sen tiedoston polkua
# myös powershell tiedosto tyyppi on .ps1 

# Esim. Yksinkertainen Get-ChildItem cmdlet
# tekee hyvää työtä, mutta kun olet päättänyt lajitella tiedot ja suodattaa vain tietynkokoiset tiedostot, sinä
# päätyä tässä näkyvään komentoon.

#tässä tulostettaan konen tiedoston polku, että tiedosto on suurempi (gt greather than) kuin n. 1000 kilotavua (kt)
PS C:\WINDOWS\system32> Get-ChildItem C:\Users\Name\Documents |  Where-Object Length -gt 1000 | Sort-Object -Property name


    Directory: C:\Users\Name\Documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         23.2.2020     14.36         173892 Raporttipohja.dotx
-a----        25.10.2022     15.57          17520 Pikamuistiinpanot.one
-a----          2.1.2023     20.53          14615 powershell-2.1.23.txt
-a----          4.1.2023      8.52          26553 powershell-3.1.23.txt
-a----          4.1.2023     15.23          12338 powershell-4.1.23.txt
-a----          6.6.2019     21.44        9254861 Filetehtava.zip

<# vaihtoehtona on luoda lyhempi koodaus tai kommentosarja, ettei tarvi näppyttää esim. ylemmän rivi 11 mukaan,
että luoo funtio scriptauksen eli jokin toiminta foreach jotakin 
eli luoo powershell script tyyppin .ps1 joko txt kautta tai kirjoittaa ihan perus scriptauksen powershell ise:stä,
joka saa oletuksena valmiina koneesta  (jos on pc / windows laite)
#>

<# DirectoryList.ps1 #>
foreach ($i in $args) 
 {Get-ChildItem $i | Where-Object length -gt 1000 | 
 Sort-Object -property name}


# toistettaan toi ylempi DirectoryList.ps1 tiedosto powershell kommennossa ja haetaan se kyseinen polku esim. ladattuna tai luoo oman scriptin sijainnin sille jotta löytää helppoiten
# perus scriptti harjoitus, ei mikä hyvä tai huono, mutta powershell kommennolla menee oikeeseen tiedosto polkuun ja toistat $dir kommenon niin näkyy koko sarakke ja toiminnaltaan sama methodi, 
# mutta tässä scriptauksessa on rajoitettu, että halutaan nähdä TIEDOSTO on SUUREMPI KUIN 1000 kt (kilotavua)
# myös voidaan lukaista muita polkuja jotta tulostettaan se yli 1000 kt tiedostonn
PS C:\Users\Name\Documents> .\DirectoryList.ps1 C:\Users\Name\Documents\

    Directory: C:\Users\Name\Documents

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         23.2.2020     14.36         173892 Raporttipohja.dotx
-a----        25.10.2022     15.57          17520 Pikamuistiinpanot.one
-a----          2.1.2023     20.53          14615 powershell-2.1.23.txt
-a----          4.1.2023      8.52          26553 powershell-3.1.23.txt
-a----          4.1.2023     15.23          12338 powershell-4.1.23.txt
-a----          6.6.2019     21.44        9254861 Filetehtava.zip

# myös voidaan lukaista muita polkuja jotta tulostettaan se yli 1000 kt tiedostoa, 
# mutta huom. kun tarkistaa oikeasti omasta tietokone tiedosto kansiosta niin se on eri asia, vaikka siellä oiskin useampi kansio, mutta tämä scripti ei lue muita kansion tiedostojen kokoa

PS C:\Users\Name\Documents> .\DirectoryList.ps1 C:\Users\Name\Downloads

    Directory: C:\Users\Name\Downloads

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----          5.1.2023     12.32      482321237 MiniMovie.mp4
-a----        28.11.2021     18.08        1523634 7z2106-x64.exe
-a----          6.4.2021     11.34       29378296 audacity-win-3.0.0.exe
-a----          2.8.2022     11.01        1387275 Cisco VPN (5).pdf
-a----        15.11.2022     16.25         583542 Spring-House.pdf
-a----          4.7.2022     20.21        4171969 firewall_asa5505 (1).pdf
-a----         24.3.2021      9.24      114412664 GitHubDesktopSetup.exe
-a----        27.10.2020     17.33       74839360 OBS-Studio-26.0.2-Full-Installer-x64.exe
-a----         17.5.2021     12.35      164264488 PacketTracer800_Build212_64bit_setup-signed.exe
-a----         23.1.2022     21.31       20163916 ccna-200-301-official-cert-guide-volume-pdf-free.pdf
-a----         30.9.2020     20.17        2843648 putty-64bit-0.74-installer.msi
-a----          8.2.2021     13.00        1384728 TeamsSetupx64_s_8D8CC204D346ABA-7-0_.exe
-a----         21.8.2021     20.26     2877227008 ubuntu-20.04.2.0-desktop-amd64.iso
-a----         22.8.2021     15.16      651468992 VMware-workstation-full-16.1.2-17966106.exe
-a----         1.10.2020     10.54       11161560 WinSCP-5.17.7-Setup.exe

##########
# toinen esimerkki

<# scriptissä luetaan verkon valvonnan (network admin), tämä  leikisti tuottaa käynnissä olevan prosessin
ja kirjoittaa tulokset tekstitiedostoon muotoiltuna ja lajiteltuna taulukkoon

ennen suorittamista, editoi scriptauksen tiedoston polku sijaintia johonkin järkevään paikkaan esim.
C:\Users\Name\Documents | tai joku muu, koska script yhessä kohdassa tulee sijoittaa sijainti eli:
 {$strFile = "C:\Users\Name"+ $i +"Processes.txt" 
koska kun powershell kommennossa kun suoritettaan tämän scriptauksen tiedosto tyyppi, niin se suorittaa toiminnan
ja tallentaa kyseisen käyttäjän tietokonen sisäisen asetukset ja tallentuu kolme txt tiedosto sinne annettujen tiedosto polku kansioon

tai joskus saattaa tulostaa niitä 3 txt tiedostoa C:\Users\Name\ tähän polkuun (käyttäjä määritti haluamansa polun, mutta tulostuu SEN edellisen kansion)
ja siinä tulostuu nimenä: 
Documents127.0.0.1ProcessesTieto
DocumentslocalhostProcessesTieto
DocumentsloopbackProcessesTieto
#>

PS C:\Users\Name\Documents> .\ListProcessesSortResults.ps1
Testing localhost please wait ...
Testing loopback please wait ...
Testing 127.0.0.1 please wait ...









