# ⚙️ Power Apps:in Admin Center

Jokaisella Microsoftin työkalulla on oma **admin-ympäristö**, jonka kautta hallitaan kyseisen sovelluksen asetuksia ja käyttäjiä. Tässä muutamia esimerkkejä:

- **Yleinen Microsoft 365 Admin Center** (`admin.microsoft.com`)  - tämä on sama identtinen asetus idea kuin virallinen entra etusivu, azure ad portaali (entra id) ja jne - mutta nämä sivustot tarjoaa saman työkalun riippuu vain asetuksen hallintaa mitä halua muuttaa. Esim. lisenssi voi lisätä admin centerin kautta.
  → Käyttäjien, ryhmien, lisenssien ja organisaation asetusten hallinta

- **Exchange Admin Center**  
  → Sähköpostien asetukset, kuten postilaatikot, lähettäjät, vastaanottajat ja viestien seuranta

---

## 🧩 Power Apps ja Power Platform Admin Center

Power Apps kuuluu osaksi Power Platformia, ja sen hallinta tapahtuu **Power Platform Admin Centerissä**:  
🔗 [admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com/)

Täällä voit hallita:

- **Ympäristöjä (Environments)**: Luo, nimeä ja poista ympäristöjä eri käyttötarkoituksiin (esim. testi, tuotanto)
- **Kapasiteettia**: Seuraa ja hallitse Dataverse-tallennustilaa ja lisenssejä
- **Käyttäjiä ja rooleja**: Määritä, kuka voi käyttää mitäkin sovellusta ja millä oikeuksilla
- **Tietoturva-asetuksia**: Hallitse käyttäjien pääsyä, istuntojen aikakatkaisuja ja tiedostoliitteiden rajoituksia
- **Tuoteasetuksia (Product Settings)**: Ota käyttöön tai poista käytöstä ominaisuuksia, kuten AI Builder, Power BI -upotukset ja Copilot-toiminnot

> 🔐 Huom: Jotta voit käyttää näitä asetuksia, sinulla tulee olla **Power Platform Admin** tai **Global Admin** -rooli Azure AD:ssa.

Lisätietoa: [Microsoft Learn – Power Platform Admin Settings](https://learn.microsoft.com/en-us/power-platform/admin/power-platform-settings)

---

Haluatko, että teen tästä myös visuaalisen kaavion tai lisään esimerkin tyypillisestä ympäristörakenteesta (esim. testi vs. tuotanto)?
