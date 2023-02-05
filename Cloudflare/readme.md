# Cloudflare

Cloudflare, Inc. on yhdysvaltalainen yritys, joka tarjoaa sisällönjakeluverkkoa, DDoS-suojausta ja muita pilvipalvelua. Verkkosivusto, joka on otettu käyttöön, ei itse jaa sisältöään, vaan Cloudflare toimii sille käänteisenä välityspalvelimena.

Cloudfrale toimii kuin välittäjänä asiakkaan ja palvelimen välillä käyttämällä käänteisellä välityspalvelinta verkkosivustojen peilausta ja välimuistia. Sen tarkoituksena on vähentää latenssia, kaistanleveyttä ja sivuston latausaikaa, kun käyttäjät vierailevat verkkosivua. Cloudflare tarjoaa suuria DNS (doman name system)- ja julkisia DNS-selvityspalveluita. Molempia tarjotaan yksityisyyden ja nopeuden ensisijaisina vaihtoehtoina Internet-palveluntarjoajan DNS-palvelimille. Esim. jos käy haku sivustolla 1.1.1.1 palveluun, joka tukee minkä tahansa laitteen.

Cloudfrale tarjoaa myös DDoS-suojausta, sähköpostien lajittelua, verkkosovellusten palomuuria ja uhkien estämistä. 

![Alt text](images/cloudflare-2.png)

* [Domain servers](#Domain-servers)
* [DNS skannaus](#DNS-skannaus)
* [Nameserver](#Nameserver)
* [Proxy status](#Proxy-status)

## Domain nimi

Yleinen domain luonti / muokkaus muu vastaava

![Alt text](images/cloudflare-1.png)

## DNS servers

Verkkokäyttöiset sovellukset, kuten selaimet, käyttävät jotain nimeltä Stub Resolver vuorovaikutuksessa DNS:n kanssa. Kun sovellus tai selain on saanut verkkosivuston IP-osoitteen, he voivat käyttää sitä HTTP- tai HTTPS-protokollien avulla.

DNS:llä on neljä tyyppistä kategoria nimipalvelimia (nameserver), josta ovat root:in, TDL:n (top-level domain) ja virallinen (authoritative) nimipalvelimet.  Nämä neljä tyyppiset kategoriat toimivat yhdessä harmoniassa suorittakseen tehtävän toiminnan määritettyihin toimialueen IP-osoitteen käyttäjäille/asiakkaalle.

![Alt text](images/cloudflare-8.PNG)


## Nameserver

Suom. nimipalvelin, joka viittaa DNS komponentiin, että tärkeä osuus nimitiloissa (namespace) ja Internetissä. Tärkein tehtävänä se on DNS-palvelimen kuin käännös joka tukee <b> domain nimit (verkkotunnus esim. sivusto.fi) </b> ja <b> host/isäntä </b> IP-osoitteen (93.47.123.4), toisena päänimeä tilaa Internetin, joka  käytetään tietokonejärjestelmien ja -resurssien tunnistamista japaikantamista Internetissä. 

Periaatteessa nimipalvelin (nameserver) viittaa DNS:ään (Domain name system), ja sitä voi käyttää myös kaikissa tietokoneohjelmissa, jotka toteuttavat verkkopalvelun (network service)  ja niitä voi vastata hakemistonpalvelua (directory service) ja kääntää usein  inhimilliseen merkitykselliseen tekstiin.

![Alt text](images/cloudflare-5.PNG)



## Proxy status

Organisaatiolla on aina oma työkalu väline, jossa suoriuttuu joko kommunikointi/viestintä tai muu tärkeä väline kuten selaimien chätti kanava, bloggit, dokumenttien säilytys tai muu sovellus, että näillä on tärkeät dokumentit/infot.  

<b> Proxy status </b> tarkoittaa liikenteen osoitteenmuutosta, josta julkisesti liikenöityy <b> IP-osoite </b> joko <ins> yksittyisellä </ins> tai <ins> julkisella </ins> osoitteella. Cloudflare käsittelee tietuen tulevia liikenteitä, että ottaa käyttöön palvelimille A, AAAA ja CNAME tietuet. 

![Alt text](images/cloudflare-6.png)

DNS proxied (oranssi pilvi päällä) tarkoittaa, että näytettään Cloudflare IP-osoiteta A.B.C.D & Näin joten pitäisi kulkea Cloudflare järjestelmän lävitse, mitä tekee sivustosta nopeamman, turvallisemman ja älykkäämän. Sitä käytettään parhaiten subdomain eli aliverkkontunnuksien / alidomainta (testi.domain.fi)

Harmaa pilvi eli DNS Only tarkoittaa ei kulje Cloudflare:n ylitse, mitä eroaa pilvi päällä vai ei? Sitä käytettään jotka liittyy muuta kuin verkkoliikennettä kuten organisaatio yksityiset salaiset asiat / dokumentointi mm. sähköposti, ftp, ja ssh, eli tietoliikenneverkon protokollat ja muut salaiset käyttöön ottot. FTP - file transfer protocol.

![Alt text](images/cloudflare-7.png)


