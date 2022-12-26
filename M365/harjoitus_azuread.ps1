# powershell ja azure ad kommennot

PS C:\WINDOWS\system32> 

#jos ei ole määrittänyt azure konffausta powershell:iin kantsii sellaista konffata ja tässä käytetätän azure ad (active directory)
PS C:\WINDOWS\system32> install-module -name azuread

#jonka jälkeen kysyy haluatko tehdä luotamuksen arkiston

Untrusted repository
You are installing the modules from an untrusted repository. If you trust this repository, change its
InstallationPolicy value by running the Set-PSRepository cmdlet. Are you sure you want to install the modules from
'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): Y

# siinä menee hetki kun se lataa sen azure ad pakettin ja suorittamisen ja jonka jälkeen tarkistellaan kommentoja että löytyy kyseisen funktiota ja yms toimintoja

PS C:\WINDOWS\system32> get-command -module azuread

# jos yrittää kokeilla edellisen kommenon jokin testauksen esim. $get-azureaduser - josta tulostuu punainen error, koska käyttäjä ylläpitäjä pitää ottaa yhteytä suoraan azure ad:seen
# joten ennen sitä pitää ottaa yhteytö office azure ad eli kirjautua sisään 

PS C:\WINDOWS\system32> connect-azuread

# jonka tulostaa kirjautunun sisään kyseisen käyttäjän tunnuksen (kokonainen sposti domain nimi), environemnt, tenant id , tenant domain (sposti loppu osa onmicrosoft.com) ja jne.

# tämän jälkeen voi kokeilla uudestaan sitä komentoa eli rivi 20 ($get-azureaduser)
# HUOM ennen aloittamista kantsii kirjautua aina azure ad:seen, koska vaikka aloittaisi alusta niin powershell admin ylläpitoa ei koskaan muista sitä.





