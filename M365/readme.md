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

## lataus steppi:

Tässä on lyhyesti miten se lataus ohje meni. Fyysisen työasemaan (windows), avaa *Windows powershell* (run as admin) - niin siinä ponnahtaa harmaa ikkuna, josta salli tekemät muutokset. 

```
S C:\WINDOWS\system32> Import-Module Microsoft.Graph.Authentication -Force
Import-Module : File C:\Users\zhao-\OneDrive\Asiakirjat\WindowsPowerShell\Modules\Microsoft.Graph.Authentication\2.28.0
\Microsoft.Graph.Authentication.psm1 cannot be loaded because running scripts is disabled on this system. For more
information, see about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.
At line:1 char:1
+ Import-Module Microsoft.Graph.Authentication -Force
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : SecurityError: (:) [Import-Module], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess,Microsoft.PowerShell.Commands.ImportModuleCommand
PS C:\WINDOWS\system32> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
PS C:\WINDOWS\system32> Import-Module Microsoft.Graph.Authentication -Force
PS C:\WINDOWS\system32> Connect-MgGraph -Scopes "User.Read"
Connect-MgGraph : An error occurred when writing to a listener.
At line:1 char:1
+ Connect-MgGraph -Scopes "User.Read"
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [Connect-MgGraph], EventSourceException
    + FullyQualifiedErrorId : Microsoft.Graph.PowerShell.Authentication.Cmdlets.ConnectMgGraph

PS C:\WINDOWS\system32> Connect-MgGraph -Scopes "User.Read"
Welcome to Microsoft Graph!

Connected via delegated access using 14d82eec-204b-4c2f-b7e8-296a70dab67e
Readme: https://aka.ms/graph/sdk/powershell
SDK Docs: https://aka.ms/graph/sdk/powershell/docs
API Docs: https://aka.ms/graph/docs

NOTE: You can use the -NoWelcome parameter to suppress this message.

PS C:\WINDOWS\system32> Get-ExecutionPolicy -List

        Scope ExecutionPolicy
        ----- ---------------
MachinePolicy       Undefined
   UserPolicy       Undefined
      Process       Undefined
  CurrentUser    RemoteSigned
 LocalMachine       Undefined



PS C:\WINDOWS\system32> Get-MgUser

DisplayName       Id                                   Mail                                          UserPrincipalName
-----------       --                                   ----                                          -----------------
Admin Company     ABC123-ABC123-ABC123-ABC123456789ABC                                               admin@companyName...
```


# Microsoft 365
Office 365 (kait tunnetaan parhaiten Word, excel, power point ja jne)

<img src="images/m365_roles-1.PNG" width="450">

<img src="images/m365_roles-2.PNG">

<img src="images/m365-licens-pack1.PNG">

<img src="images/m365-licens-pack1.PNG">

## dns domain malli

<img src="images/dns-esim1.PNG">
