# Ensimmäinen Power Apps sovellus - heinäkuu 2025

Tämä on ensimminen power apps sovellus ja kirjauduin omalla admin tunnuksilla sisään, että kuinka tämä toimii ja harjoituksen kannalta kokeilin "start with copilot". 

Tässä on muutama kuva, josta kuin kirjautuu ja aktivoi ensimmäisen kerran Power App:sin sovelluksen/työkalunsa.

 ![alt text](./PowerApps-image/2.png) 

 ![alt text](./PowerApps-image/3.png) 

 ![alt text](./PowerApps-image/4.png) 

 ![alt text](./PowerApps-image/5.png) 

---

# Seuraavaksi alettaan valita pohja

Tästä kannattaa kysyä tarvittaessa tekoälyltä **Microsoft copilot** tai yleis CHATGPT apua, koska jos ei tiedä mitä on tekemässä ja kannattaa tehdä vertailua - molemmilla on yhtä hyvät ohjeet ja neuvot, mutta riippuu kummasta tykkää ja luottaa.

## Aloitettaan "new apps"

New app listan alta:
- Start with Copilot (tekoälyavusteinen sovelluksen luonti)
- Start from Data (aloita valitsemalla tietolähde, esim. SharePoint, Excel)
- Start from a page design (rakennetaan valitusta sivusta)
- Start from an app template (valmiin mallin käyttö)

## start from with a blank canvas

Otin ensimmäisenä "start with a page design"

 ![alt text](./PowerApps-image/6.png) 

 Seuraavaksi otin ihan normi "blank canvas"

 ![alt text](./PowerApps-image/7.png) 

 Sitten se alkaa skannaa ja hakea editointien materiaalia, niin hetken päästä avautuu se Power apps studio (alempi kuva)

Aika tylsä ja perus ensimmäinen appi kuvaus - ei kauheasti mitään erikoista tällaisessa kuvassa, mutta kokeillaan toisella (Start from copilot) versiolla.

 ![alt text](./PowerApps-image/8.png) 

---

# Toinen esimerkki apps - START HERE;

Otin nyt "start with copilot" pohja

 ![alt text](./PowerApps-image/9.png) 

 Start from Copilot ja anna tekoälylle ohjeet: esim. "Create a simple contact form app" — se luo sinulle sovelluksen automaattisesti.

 ![alt text](./PowerApps-image/10.png) 
 
 ![alt text](./PowerApps-image/11.png) 

 Sitten se alkaa generoimaan ja antaa se Apps tehdä oman hommansa.

 ![alt text](./PowerApps-image/12.png) 


Sitten voila ja tuloksena se loi jonkinlaisen taulukonsa: <br>
Kokeilin ton "copilot" vähä kuin chätti oletuksena, että tekee jotakin ja esim. Rakentaa/muokkaa/lisää uutta taulukkoa alle.

 ![alt text](./PowerApps-image/13.png) 

 ![alt text](./PowerApps-image/14.png) 
 
 ![alt text](./PowerApps-image/15.png) 

### 🔎 Mitä "Start with Copilot" teki? 

Kun kirjoitin:
- "Create a simple contact form app"
Power Apps rakensi automaattisesti sinulle pienen sovelluksen, jossa:
- On Contact-näkymä (lista yhteystiedoista)
- On Contact Details -näkymä (lomake yksittäisen kontaktin tiedoille)

<br>
Tuossa yhdessä kohdassa "Department" luokkan sisään lisäsin toisen kategorian joka on IT (california) <br><br>

### Seuraavaksi tallennettaan ja avataan tämä ns. Mini sovellus:

 ![alt text](./PowerApps-image/16.png) 

 ![alt text](./PowerApps-image/17.png) 

 ![alt text](./PowerApps-image/18.png) 
 
 ![alt text](./PowerApps-image/19.png) 

 ![alt text](./PowerApps-image/20.png) 

 ![alt text](./PowerApps-image/21.png) 


 Tässähan se kalifornia onkin.
 
 ![alt text](./PowerApps-image/22.png) 

 Tässä jatkuu jotenkin jännästi
 
 ![alt text](./PowerApps-image/23.png) 

 ![alt text](./PowerApps-image/24.png) 

Jotenkin jännästi yrittää julkaista, mutta tuleeko käyttäjille oikeuksia sitten pitää tarkistaa..

![alt text](./PowerApps-image/25.png) 

![alt text](./PowerApps-image/26.png) 

Kun menee takaisin Power Apps etusivulle (https://make.powerapps.com/environments/<omatenant-ID>) ja vaseman kategoriasta (apps) - niin siinä näkyy tallennettu sovellus.
 
![alt text](./PowerApps-image/27.png) 

---

# Julkaiseminen ja jakaminen tämä sovellus käyttöön - START HERE - MINI OHJE JA TEORIA:

miten Power Apps -sovellus voidaan jakaa muille, ja miten se poikkeaa Azure AD:n "Enterprise Applications" ja "App registrations" -konsepteista.

Tällä on jotakin eronsa verrattuna normaaliin Entra ID (app registration ja enterprise application) sovellukseensa. 

| **Kysymys** | **Vastaus** |
|------------|-------------|
| Voinko jakaa Power Apps -sovelluksen Developer Planista muille? | ❌ Et voi |
| Miten voin jakaa sen? | ✅ Siirrä sovellus tuotantoympäristöön, jossa on Power Apps -lisenssit |
| Liittyvätkö "App Registration" ja "Enterprise Application" Power Appsiin? | ❌ Ei suoraan – ne liittyvät Azure AD:n käyttöoikeuksiin ja API-käyttöön |

---

# Jatkuu pieni lisäys koodina - Power FX kaava - START HERE;

Tosiaan tässä Power Apps sovelluksessa ja editoinnin alla ei voi koodata, että se on suurin pettymys ja voi vain koodata tonne lisäämällä noita editointi välineitä esim. klikkaa nappi ja tulostaa tekstin vaikappa viestin: (Hello world!).

1. Otin tuosta tyhjän blank vähä kuin tyhjä kenttä sivuston.

![alt text](./PowerApps-image/28.png) 

2. lisätään komponentteja: "Insert" --> haku sanalla "button"
3. lisätään myös sama komponentteja "Label" koska halutaan näyttää button klikkattusta nappista tulostettuna label-kenttään.

![alt text](./PowerApps-image/29.png) 

4. kirjoitettaan "koodi" Power FX kaavaan
5. oikealla tulee button nappien lisäominaisuutta niin "advanced" kentän alle "actions" osuuden -> "OnSelect" kenttään tulee se pieni määritettämä haluamansa viesti esim. just joku tervehdys.

![alt text](./PowerApps-image/30.png) 

Klikkaa Label-komponenttia ja sen Text-ominaisuuteen kirjoita: myMessage.

![alt text](./PowerApps-image/31.png) 

![alt text](./PowerApps-image/32.png) 

## 🔍 Mitä tässä tapahtui? <br>
- Set() on Power Fx:n komento, jolla tallennetaan arvo muuttujaan (tässä myMessage)
- Label.Text = myMessage näyttää sen arvon
- Kun käyttäjä klikkaa painiketta, viesti muuttuu






















