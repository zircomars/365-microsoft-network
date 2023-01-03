# Powershell kommentoja 

special kommentoja josta voidaan luoda scripttauksia algroitmiä, objectia, parametriä, filteröintiä ja yms

## lisää harjoituksia

https://learn.microsoft.com/en-us/training/browse/
https://learn.microsoft.com/en-us/training/browse/?terms=powershell

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


## modules

Moduuli on paketti, joka sisältää PowerShell-jäseniä, kuten cmdlettejä, palveluntarjoajia, toimintoja, työnkulkuja, muuttujia ja aliaksia.

Toimii  powershell versio 3:sta tai sitä uudempaa versioon & Toimitetaan osana eri ohjelmistopakettien hallintatyökaluja

wildcard characters tarkoittaa tähteä * ja suomeks. jokerimerkki, powershell ympäristössä se tarkoittaa komentojen olevian etsimistä, ei käyttöä ja eivät tuo mitään moduuleja esim. nämä alemmat kaksi komennot ovat samoja

PS C:\WINDOWS\system32> Get-Module

## Alias

Tarkoittaa powershell toiminnan lyhenteitä esim. dir = direction

PS C:\WINDOWS\system32> Get-Alias "Dir"

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           dir -> Get-ChildItem

Syöttämällä komennon niin periaatteessa sama methodi toimii molemmissa termeinä esim.  $dir tai $Get-ChildItem - että molemmat toistaa hakemiston, myös voidaan luoda oma alias lyhenne toiminta. myös muita esim. $cls tai $clear puhdistaa koko powershell komentorivin

jos haluaa luoda oman uuden komennon menisi alemman mukaan, eli Demo tilalle luoo oman haluamansa lyhenteen:
New-Alias –name “Demo” Get-ChildItem

ainii myös kun käynissä oleva powershell admin istunnon se uusi komennon alias tapahtuu vain kerran, ettei sitä voi käyttää jatkuvasti sitä samaa, koska muuten tulisi tekee powershel ISE scriptauksessa (jotenkin jännästi)


## Pipeline

Kommenossa se tarkoittaisi | (putki)

komento lyödään powershell, sillo ollaan Pipeline kuvitteelinen putki, joka kuvaa kommenon suoritusta. putken vasemsta sorvutaan objekteja sisään ja putken oikeast pätkästä muokattuja (ei aina). 
useampi kommenotja objektejä mm. filteröinti, muokkausta, mittaamisesta, sorttausta, laskemista ja yms. voidaan tuottaa näkymä näillä format komennolla. periaatteessa tapahtuu putken sisällä.

listatat jokeri merkkejä get up computer vs muuta, varsinaiset filtterit where object kommennon käyttö ja basic malli. 
enumerating viittaa prosessiin haettaan jostakin, yksikerralaan muokkataan niitä ja ei voi tehd yhtä aikaan esim. muokata joidenkin koneiden ominaisuuksia.  haetaan koneet muuttujaan ja sen jälkeen joudutaan yksittelen tekemään muutosta. 
koska komennossa siellä on parameter computer name, ja sitä nimi voi vaa yhden objektin. jolloin luetaan yksi kerrallaan, for each silmukassa käsitteelee yksittelen ja taas seuraava.
