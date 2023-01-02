# Powershell kommentoja 

special kommentoja josta voidaan luoda scripttauksia algroitmiä, objectia, parametriä, filteröintiä ja yms

## cmdlet struktuurit

Verbit: get, set, new, add, remove
noun eli substantiivit: service, process

![Alt text](harjoituksia/images/powershell-calc-properties-1.PNG)

## parametrit

on lisättävä paremetrit ja on jokin arvo

paremetrit määrittää toimintaa command:itlle, mihin object ominaisuus kohdistuu esim. set ad user ja jne. voi olla filtterit ja joku parametrit ja tekee jotakin esim. järjestää uudestaan sort obnject ja sille annettaan parametri ja yksittäinen attribuutti aakkosjärjestyksessä (nouseva tai laskevat)

parametriä voi sijoittaa arvoja, ja eroteltuna pilkkuna - computer names muuttujaan viedään asoita (huono esim.) 

joskus parametri nimi on valinnainen position parameter, esim. get-service BITS << palvelunimi, riittää kun arvo laitettaan oikeaan paikkaan
get-serivce -name BITS (selkeä lukuseksi, mutta sama kuin ylempi, BITS = background intelligent transfer service). position parametri 

Get-help on ominaisuuksia ja synktasia, kun on kulma sulku <string> pakolinen ja hakasulku [valinnainen] 

esim:
Get-Service -Name winrm, netlogon
Get-help About*
Get-help about_TestDrive

Parametrin tunnistaa edeltävien yhdysmerkkin viiva (-), joka viittaa seuraavaksi parametrin nimi. Nimestä ja arvosta voidaan erottaa välilyönnin tai kaksoispisteellä. Jotkut parametrit eivät vaadi tai hyväksy pamaetrin arvoa, mutta muut parametrit vaativat arvon, mutta eivät vaadi parametrin nimeän  komennossa.

![Alt text](harjoituksia/images/powershell-parameter-1.PNG)


## alias

joko vaihtoehtoisia nimejä puhtaihta alias, ja lyhenne kuten dir, cd, mkdir, type

ei ole com tiedosto, vaan käyttöjärjestelmä pohjaisia ja powershell / alias systeemi tulee pien ongelma esim. $dir - palauttaa tiedosto polun
$dir /s - listaa kaikki aliakset, koska se ei toimi, niin kuvittelee osa polkua ja sillä ei ole vaihtoehtoisia kommentoa eli pelkä (dir) ja lisää vaihtoehtoisia erikois hakuja niin sillä ei ole ja rajoitettu

