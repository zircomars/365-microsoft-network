# M365 sähköposti asetukset

* [Distribution list vs shared mailbox & shared inboxes ](#distribution-list-vs-shared-mailbox--shared-inboxes)
    * [Jakelulista (Distribution list);](#jakelulista-distribution-list)
* [shared mailboxes](#shared-mailboxes)

- [powershell määritykset](#powershell-määritykset)

![Alt text](images/GetImage.png)

## Distribution list vs shared mailbox & shared inboxes 

- Distribution list (jakelulista): Luettelo sähköpostin vastaanottajista, jotka on osoitettu yhdeksi vastaanottajaksi. 
- Shared mailboxes: yhden tai useamman henkilön kanssa jaettu postilaatikko. 
- Shared inboxes (ohjelmistoratkaisu): Yhteistyötyökalu, jonka avulla tiimit voivat vastata sähköposteihin yhdessä. 

### Jakelulista (Distribution list);

perus ylläpitävien luettelon spostin vastaanottamista ja osoitettu yhdeksi vastaanottajaksi. 

Lista tukee koko tiimin, esim käsittelee asiakastukea, henkilöstöä.  

Toiminnaltaan: kun lähettää spostiviestin jakelulistan osoitteeseen niin viesti kopioidaan ja toimitetaan useisiin postilaatikoihin jakelulistalle määritettyihin vastaanottajien henkilöstkohtaisiin sposti osoitteisiin, joista kukin saa kopion spostin. Tiimin jäsen vastaa jakelulistan kautta saatun spostin, vastaus lähetetään hänen henkilökohtaisee spostin osoitteeseen. 

- Esim. tiimi@domain.fi <----> matti.meikalainen@hallinta.fi & periaatteessa tiimistä pitää yksittäinen henkilö ottaa vastaan, että pitää keskustella matti meikäläisen kanssa.  
- Spostista ei voida lähettää jakelulistasta osoitteseen, kun jakeluluettelon kautta vastaanotettu sposti poistettaan, se poistaminen vain tpaahtuu toiminnon suorittaneen henkilön spostista. 

- <b> Hyödyt: </b> jotka on tehty yksisuuntaiseen viestintään, minkä ne toimivat yrityksen ilmoitusten tai tietojen jakamista ja eivät toimi viestintäkanavien asiakkaiden kanssa. 

- <b> Riskit: </b> käyttö voi olla monimutkaista, mutta sekavien postilaattikoiden kannalta  jäsenet saavat kopion jokaisesta viestistä, että se aiheuttaa sekasotkua saapuvista sähköpostilaatikosta ja tehottomuutta. Kopio tarkoittaa, että kaikki tiimin jäsenet käyttävät aikaa samoja spostien kirjoittamista ja lajitteluun.  

Muita ongelmia voi johtaa vastuullisuutta, näkyvyyttä ja yhteistä työn puutetta. Myös seurauksena monen asiakkaiden palvelutiimien voivat korvata jakelulistan sposti pohjaisiin jaettuihin postilaatikkoihin tai jaetuilla posti laatikkon hallinnan yrityksen viestintään. 

## shared mailboxes

Tiimin jäsenet kirjautuvat sisään käyttämällä samaa jaettua käyttäjätunnusta ja salasanaa jaettuun postilaatikkoon. 
Jaettu postilaatikko on kuin yksittäinen spostilaatikko paitsi useat tiimit jäsenet käyttävät sitä jaettujen kirjautumistietojen avulla. 
Jaettuja postilaatikoita käsittelee koko tiimi, kuten asiakastukitiimi, henkilöstötiimi tai myyntitiimi. 

Kun asiakas lähettää sähköpostin jaettuun postilaatikon osoitteeseen, se toimittaa viestistä yhden kopion jaettuun postilaatikon osoitteeseen. 

Kun henkilö lähettää viestin jaetussa postilaatikossa tai vastaa siihen, vastaus näyttää tulevan jaetun postilaatikon sähköpostiosoitteesta eikä henkilön sähköpostiosoitteesta. 

Jos poistaa sähköpostiviestin jaetusta postilaatikosta, se poistaa sähköpostin kaikilta, joilla on pääsy tähän sähköpostiosoitteeseen. 

- <b> Hyödyt: </b> kuka tahansa tiimistä voi käydä käsittelee saapuvia sposteja. Eli saapuvista viesteistä näkee kuka on vastannut ja mihin ei. 
Jaetut sposti eliminoivat kopioida tai välittää spostiketjujina, jotka kertovat muille tiimin jäsenille, kun he vastaavat siihen/asiakkaalle. Myös saattavat joutua käyttämään menetelmiä sisäisen keskustelluun, mitä voi johtaa sekaannusta.  

- <b> Riskit: </b> sposti lipsuvat hakemistojen läpi tai niihin lähetetään useita vastauksia samanaikaisesti eri tiimin jäseniltä, eli ei tietoa kuka ottaa vastaan tai ei. Saapuvista viesteistä tulee hämmäystä, kun ihmiset kirjautuu muihin tileihin tai vaihtavat näyttöä. 
Muita seurakuksena monien asikkaiden palvelimien tiimit saattavat korvata muita postilaatikoiden jaetuilla yksittäisellä postilaatikkoilla. 

# powershell määritykset