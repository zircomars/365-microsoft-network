# mitä entra id:ssä voi tehdä?

Siis yleisesti koskien azure (entra id ent. azure ad), että mitä siellä voi tehdä. Huomoina entra id on käyttäjähallinta ja suojaus, että koskien esim. käyttäjän identisyyttä, oikeuden antaminen (ryhmään, sähköposti ryhmään), lisenssi antaminen, ja tietojen täyttäminen. 

Käytäntö asetuksia (policy & conditonal access), ett esim. jos käyttäjä tai tiimi lähtee ulkomaille vain tietty maat sallittaan käyttää työkalujen kirjauttumista, josta voi kirjautua firman sähköpostiin ja jne.



## Tämä on pieni ohje ja toimii lunttilappuna:

Tämä osio sisältää ohjeet ja kuvauksen Microsoft 365:n eri osista ja toiminnallisuuksista.

---

## 🎓 Perinteiset Office-sovellukset

- **Word**, **Excel**, **PowerPoint**, **Outlook**, **OneNote**
- Saatavilla sekä työpöytäsovelluksina että selaimessa.

---

## ☁️ Pilvipalvelut ja yhteistyövälineet

- **OneDrive for Business** – henkilökohtainen pilvitallennustila
- **SharePoint Online** – tiedostonhallinta, intranetit
- **Teams** – viestintä, kokoukset, tiimityö, integraatiot
- **Loop** – uusi työkalu yhteistyösisällön luomiseen reaaliaikaisesti

---

## 🔐 Hallinta ja suojaus (etenkin IT-osastoille)

- **Microsoft Intune** – laitteiden ja sovellusten hallinta (MDM/MAM)
- **Microsoft Defender for Endpoint** – päätelaitteiden suojaus
- **Microsoft Entra ID** (ent. Azure AD) – käyttäjien tunnistaminen, kirjautumiset
- **Purview / Compliance Center** – tietoturva, tiedonhallinta, tietosuojan valvonta

---

## 🛠️ Hallintaportaalit ja analytiikka

- **Microsoft 365 Admin Center** – käyttäjien ja lisenssien hallinta
- **Power Platform** (Power BI, Power Automate, Power Apps) – analytiikka, automatisointi ja sovelluskehitys

---

## 🔗 Voiko Entra ID:ssä (Enterprise Applications) rakentaa järjestelmäintegraatioita?

**Kyllä voi.** Enterprise Applications -osiossa voit:

### ✅ 1. Integrointi sovellusten kanssa (SSO, provisiointi)

- Lisää kolmannen osapuolen sovelluksia (esim. Salesforce, ServiceNow, Google Workspace)
- Käytä Single Sign-On (SSO) -integraatioita: SAML, OAuth, OpenID Connect
- Ota käyttöön käyttäjäprovisionointi (tilien automaattinen luonti, päivitys, poisto)
- Tuki SCIM-protokollalle tietyissä sovelluksissa

### ✅ 2. Custom-sovellukset (oman järjestelmän integrointi)

- Rekisteröi oma sovellus (App registrations / Enterprise Applications)
- Integroi käyttäjien kirjautumiseen (OpenID Connect / OAuth 2.0)
- Hallinnoi käyttöoikeuksia (roolit, ryhmät)
- Hyödynnä API-kutsuja access tokenin avulla (Entra ID)

### ✅ 3. Käyttöoikeuksien ja käyttöpolitiikan hallinta

- Käytä **Conditional Access** -sääntöjä (esim. MFA, IP-rajoitukset)
- Määrittele, ketkä voivat käyttää mitäkin sovellusta (ryhmä- tai roolipohjaisesti)
- Hyödynnä hallintatyökaluja kuten **Access reviews** ja **Entitlement management** suuremmissa ympäristöissä

---

- Tätäkin lasketaan järjestelmänintegraatioksi , koska aikaisempi tehty Microsoft Graph APIa esimerkiksi PowerShellin kautta otettu yhteyttä suoraan Microsoft 365 ympäristön hallintarajapintaan ja Entra ID/Azure AD:seen - tämä on järjestelmäintegrointia. 

- Myös sama pätee Powershell pohjaan rakennettu skripti, että ottaa yhteyttä SharePoint/Azure AD:seen kirjautumiselle ja koneeseen vaattii niitä moduulia - tämäkin on integrointia ja kyseessä on automatisoitu järjestelmien välinen tiedonsiirto
