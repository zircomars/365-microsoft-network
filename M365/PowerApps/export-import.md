# Export ja import prosessi

Power Appsissa sovelluksen export ja import ovat mahdollisia! Tämä mahdollistaa sen, että voit siirtää sovelluksen koneelle, tehdä varmuuskopion tai siirtää sen kehitysympäristöstä tuotantoon tai toiselle käyttäjälle. 

<br>
http://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/export-import-app-package <br><br>

## 📤 Sovelluksen vienti (Export)
• Voit exportata sovelluksen .msapp-tiedostona Power Apps -editorista:
	○ Avaa sovellus → File (Tiedosto) → Save As → valitse “Download a copy”
	○ Tämä lataa sovelluksen paikallisena tiedostona (.msapp), joka sisältää käyttöliittymän ja logiikat
• Export ei sisällä taustadataa (esim. SharePoint-listat tai Dataverse-taulut) — vain sovellusrakenne

## 🛠️ Muokkaus offline-tilassa (Yksittäin)
• .msapp-tiedostoa voi muokata yksittäisesti, mutta tarvitset siihen työkalun:
	○ ⚙️ Power Apps Studio (preview desktop version) tai Power Platform CLI
	○ Kehittyneemmät käyttäjät voivat käyttää PowerApps Language Editor tai muokata tiedostoa JSON-tasolla
 
## 📥 Sovelluksen tuonti takaisin (Import)
• Sovellus voidaan tuoda takaisin Power Appsiin helposti:
	○ Siirry Power Apps -portaalissa “Apps” → Import canvas app
	○ Valitse aiemmin exportattu .msapp ja nimeä uudelleen tarvittaessa
• Jos kyseessä on Power Apps package (.zip), voit myös tuoda komponentit, datayhteydet ja asetukset
 
## 💡 Hyvä tietää
• Tiedostomuoto ei ole avoin lähdekoodi (mutta Power Fx -kaavat ovat näkyvissä editorissa)
• Muokkaus on sujuvinta Power Apps -editorissa suoraan selaimessa
• Käytännössä export-import sopii esim. sovellusvarmuuskopioihin, jakamiseen tai versionhallintaan

Kun exportaat Power Apps -sovelluksen, se ei anna suoraan koodia (esim. JavaScript tai C#), vaan se tallennetaan .msapp-tiedostoksi, joka on Microsoftin oma formaatti.

## 📦 Mitä .msapp-tiedosto sisältää?
• Sovelluksen rakenne: käyttöliittymä, näytöt, komponentit
• Logiikka ja kaavat: Power Fx -funktiot, esim. If(...), Filter(...), Patch(...)
• Datayhteydet: tiedot mitä tietolähteitä sovellus käyttää (ei itse dataa)
• Metatiedot: sovelluksen asetuksia, versionumero jne.
	
Se ei siis ole varsinaisesti "koodia", mutta voit Power Apps -editorissa tarkastella sovelluksen kaavoja ja logiikkaa visuaalisesti ja myös tekstinä Power Fx -muodossa.
	
## 🧰 Jos haluat “purkaa” .msapp-tiedoston:
• Power Platform CLI -työkalulla voit muuntaa sovelluksen lähdetiedostoiksi, jolloin voit nähdä sen JSON- ja YAML-tiedostot ja Power Fx -kaavat erillään.
• Tämä on hyödyllistä versionhallintaan, kehittäjien yhteistyöhön tai vaikka CI/CD-putkiin.


Power Appsin .msapp-tiedosto ei ole avoin koodipohjainen projekti siinä mielessä kuin vaikka JavaScript-sovellus tai React-projekti olisi. Se on Microsoftin oma paketti, jota ei voi suoraan avata tekstieditorilla tai muokata täysin vapaasti. 

Lyhyesti sanottuna, voi exportaa ulos mutta joutuu jatkaa Microsoft omien työkalujen käyttöä. Vaikka kiinnostaisi rakentaa ja koodata sitä VSCode studiolla tai muula editoinnilla, sitä ei ole mahdollista vaikka osaamisessa oiskin JavaScript, TypeScript, C#, Python ja jne, kuitenkin tämä on Microsoftin oma ympäristönsä.

• Jos .msapp-tiedostoa muokkaa ulkopuolisella editorilla (esim. VS Code tai Notepad), sitä ei voi suoraan tuoda takaisin Power Appsiin toimivasti, ellei muokkaus tapahdu juuri oikeassa muodossa ja Microsoftin tuetulla tavalla.


# 🧱 Miksi ei toimi tavallisella muokkauksella?
• .msapp on rakenteellinen binääritiedosto, eikä se ole "pelkkää koodia".
• Jos tiedostoa muokkaa väärin (esim. ilman CLI-työkaluja), se voi rikkoutua tai tulla virheelliseksi Power Appsille.
• Sovelluksessa on metatietoja ja komponenteja, jotka vaativat tietyn sisäisen rakenteen — tavallinen editori ei osaa käsitellä niitä oikein.






