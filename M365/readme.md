# UPDATE 

Nykyään alkaen maaliskuu 2024 eteenpäin PowerShell kautta jos haluaa yhdistää/kirjautua Microsoft pilvipalveluun eli omaan organisaatio Azure AD (nyky nimellä Entra ID) niin pitää ladata Microsoft Graph moduuli. 
- AzureAD (AD - active directory) nyky menee nimellä **Entra ID** (alkaen heinäkuu 2023) - joka on pilvipohjainen identiteetin ja pääsynhallintapalvelu, joka tarjoaa ratkaisuja käyttäjien ja sovellusten suojaamiseen. 

Ennen 2024, käytettiin **azuread** moduulia PowerShell:issä, jotta pääsee kirjautua entra ID (azuread). Normaalisti tähän pitää fyysisen työasemaan ladata tämä azuread paketti. AzureAD ja MSOnline-moduulit on deprekoitu (vanhentunut/poistui käytöstä).
- Nyt vain `Connect-AzureAD` on vanhentunut ja korvattu `Connect-MgGraph`-komennolla Microsoft Graph PowerShell SDK:ssa. Vanha AzureAD-moduuli on poistettu tuesta 2024 alkaen.
- Normaalisti Microsoft Graph (lyh. MS Graph) toimii periaatteessa sama ideana kuin aikaisempi AzureAD - mutta nimi on vain muutettu ja moduulissa saa käyttöön koko Graph API:n laajuuden eli se ei rajoitu vain Microsoft Entra ID-asioihin. Vaikka enitsen Azure AD ikään kuin Gaprh:in selkäranka autentikoitni varten. Graphin kautta sisälty muutakin toimintoja kuten:
  - Entra ID: käyttäjät, ryhmät, roolit, sign-in lokit…
  - Entra ID: app registration, enterprise application &...
  - Intune: laitteet, sovellukset, käytäntöprofiilit, compliance-tilat…
  - Purview: auditointi, DLP-politiikat, tiedonhallinta (rajoitetusti, osa toiminnoista vaatii erillisiä oikeuksia)
  - Defender-suojauspalvelut: esim. Defender for Endpoint -hälytykset ja ilmoitukset (osa saatavilla Graphin kautta)
  - Outlook, Teams, OneDrive, SharePoint: viestit, kokoukset, tiedostot, kalenterit jne.



# Microsoft 365
Office 365 (kait tunnetaan parhaiten Word, excel, power point ja jne)

<img src="images/m365_roles-1.PNG" width="450">

<img src="images/m365_roles-2.PNG">

<img src="images/m365-licens-pack1.PNG">

<img src="images/m365-licens-pack1.PNG">

## dns domain malli

<img src="images/dns-esim1.PNG">
