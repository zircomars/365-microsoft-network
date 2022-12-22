PS C:\WINDOWS\system32> c

cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
PS C:\WINDOWS\system32> Connect-MsolService -Credential $credential
PS C:\WINDOWS\system32>

Kirjaudu m365 officeen eli ponnahtaa pien ikkuna, että pyyttää käyttäjän kirjautumaan sisään
PS C:\WINDOWS\system32> Connect-ExchangeOnline
Connect-ExchangeOnline : The 'Connect-ExchangeOnline' command was found in the module 'ExchangeOnlineManagement', but t
he module could not be loaded. For more information, run 'Import-Module ExchangeOnlineManagement'.
At line:1 char:1
+ Connect-ExchangeOnline
+ ~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (Connect-ExchangeOnline:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CouldNotAutoloadMatchingModule

PS C:\WINDOWS\system32> c

Execution Policy Change
The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose
you to the security risks described in the about_Execution_Policies help topic at
https:/go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): Yes

PS C:\WINDOWS\system32> Connect-ExchangeOnline

----------------------------------------------------------------------------------------
This V3 EXO PowerShell module contains new REST API backed Exchange Online cmdlets which doesn't require WinRM for Client-Server communication. You can now run these cmdlets after turning off WinRM Basic Auth in your client machine thus making it more secure.

Unlike the EXO* prefixed cmdlets, the cmdlets in this module support full functional parity with the RPS (V1) cmdlets.

V3 cmdlets in the downloaded module are resilient to transient failures, handling retries and throttling errors inherently.

However, REST backed EOP and SCC cmdlets are not available yet. To use those, you will need to enable WinRM Basic Auth.

For more information check https://aka.ms/exov3-module
----------------------------------------------------------------------------------------

PS C:\WINDOWS\system32>

tulostaa organisaation sisäisen henkilöstöt, mutta rajoitettu vain tulostuu alias nimi
PS C:\WINDOWS\system32> Get-Mailbox

Name                      Alias           Database                       ProhibitSendQuota    ExternalDirectoryObjectId
----                      -----           --------                       -----------------    -------------------------
a117ac14-ab10-4fa3-a17... adenh           EURP190DG059-db151             99 GB (106,300,44... a117ac14-ab10-4fa3-a17a-4f2ca8ccc35c
c5dea936-80d8-47d2-ad3... asdf            EURP190DG112-db023             99 GB (106,300,44... c5dea936-80d8-47d2-ad3c-577d13131d0a
9ec01647-3416-4fb1-89a... boooyah         EURP190DG037-db174             99 GB (106,300,44... 9ec01647-3416-4fb1-89a0-123a15f360ba
conf room                 confroom        EURP190DG118-db241             49.5 GB (53,150,2... c3f8eb49-29b2-476b-b027-3417fb4d21fd
Demo                      Demo            EURP190DG084-db156             49.5 GB (53,150,2... cd1c4f8e-bd56-4290-8a38-22b23ab7ccc4
Demo kone                 Demokone        EURP190DG089-db173             49.5 GB (53,150,2... 4685694d-4a95-4488-8b36-5cc1cf8b282d
Demoilmio Laptop          DemoilmioLaptop EURP190DG051-db061             49.5 GB (53,150,2... 6c9fb9d2-7e6c-4c4c-b6c9-600384d4b9f6
Demonstration Laptop      Demonstratio... EURP190DG089-db012             49.5 GB (53,150,2... 7790af4b-b5a8-4b4f-bb58-f8eb0c06bb1b
64cd2f42-b48b-41fd-936... dd              EURP190DG037-db001             99 GB (106,300,44... 64cd2f42-b48b-41fd-9361-db0d1508ad1c
DiscoverySearchMailbox... DiscoverySea... EURP190DG103-db076             50 GB (53,687,091...
f0f165ce-d47c-4f83-b9f... enkeksi         EURP190DG118-db127             99 GB (106,300,44... f0f165ce-d47c-4f83-b9f6-d27972c6a1ca
5647e81d-2023-4997-8be... enduser1        EURP190DG115-db095             99 GB (106,300,44... 5647e81d-2023-4997-8bef-10b23fe5e4d1
d76b5b49-8d88-4107-83a... enduser2        EURP190DG031-db124             99 GB (106,300,44... d76b5b49-8d88-4107-83af-92eb626dc841
H_Conference Room         H_Conference... EURP190DG078-db097             49.5 GB (53,150,2... d35befc9-1ce3-44a2-aa07-5c56910f621f
4018294a-37ac-4bf1-849... hannur          EURP190DG010-db025             99 GB (106,300,44... 4018294a-37ac-4bf1-8497-571a0d3084fa
386e1be5-400e-440d-b21... hevijuuseri1    EURP190DG037-db167             99 GB (106,300,44... 386e1be5-400e-440d-b219-37a8a02f9701
459a4ab9-ddaf-498e-b28... hevijuuseri2    EURP190DG043-db093             99 GB (106,300,44... 459a4ab9-ddaf-498e-b28a-ac8ae4f12d86
5de90b94-69cc-4977-9a5... jannel          EURP190DG067-db075             99 GB (106,300,44... 5de90b94-69cc-4977-9a56-035792d806e4
8b7a8624-bcc0-43b3-bae... joulutonttu     EURP190DG052-db054             99 GB (106,300,44... 8b7a8624-bcc0-43b3-bae0-4c83a205ccc0
6d36950e-43b2-4e0d-9c0... joulupukki      EURP190DG054-db068             99 GB (106,300,44... 6d36950e-43b2-4e0d-9c09-5e7ac273d594
Konferenzia Raum          KonferenziaRaum EURP190DG107-db192             49.5 GB (53,150,2... b7bf3f7c-eb3d-4d55-9285-98ee63f65cd5
931035f1-d1ee-4b7e-84d... nathalies       EURP190DG062-db019             99 GB (106,300,44... 931035f1-d1ee-4b7e-84dd-0093476ce771
Paketit                   joulupaketit    EURP190DG098-db114             49.5 GB (53,150,2... 3ff59d2d-fcbc-400e-81a6-dcfede9db76f
Projects                  projects        EURP190DG114-db118             49.5 GB (53,150,2... d8502f9c-9258-4a0c-af1f-8836d00e1af6
projetcssss               projekti_boksi  EURP190DG058-db081             49.5 GB (53,150,2... 0e6f4137-7f2d-43b2-8c5e-165c72236f3e
fff88c41-7fce-4444-974... ronis           EURP190DG098-db016             99 GB (106,300,44... fff88c41-7fce-4444-974d-7f6267a9a1b2
60cfae61-7a39-4306-be7... ronitest1       EURP190DG118-db168             99 GB (106,300,44... 60cfae61-7a39-4306-be78-1e98afdacf39
ec743781-9b02-43a6-9ff... ronitest2       EURP190DG071-db003             99 GB (106,300,44... ec743781-9b02-43a6-9ff5-276d5a8125d4
bfbaee4b-778b-4f01-b91... ronitest3       EURP190DG116-db234             99 GB (106,300,44... bfbaee4b-778b-4f01-b913-1e5852017bda
RSKonferenssi             RSKonferenssi   EURP190DG039-db126             49.5 GB (53,150,2... d18d01d0-938b-444f-879d-fa437cdf2a59
RSProjects                rsproject       EURP190DG118-db176             49.5 GB (53,150,2... 65fa2ca5-98b6-439a-96b0-a9989a3758a1
2fdf11fc-d948-4478-8bb... samik           EURP190DG082-db041             99 GB (106,300,44... 2fdf11fc-d948-4478-8bba-3aa1cc38b209
0794d50e-37a1-480d-b4a... simop           EURP190DG084-db050             99 GB (106,300,44... 0794d50e-37a1-480d-b4a8-8c03e3e492a6
talvi                     talvi-alias     EURP190DG003-db119             49.5 GB (53,150,2... 70f1b325-6fdd-49f8-b7c7-45fce9e4c34c
talvi-demo                talvidemo       EURP190DG082-db127             49.5 GB (53,150,2... dd38e7b5-a865-45dd-80f1-406514455f83
d7b2c037-1900-4188-a7a... toivol          EURP190DG120-db108             99 GB (106,300,44... d7b2c037-1900-4188-a7ac-ea1a273c18cf
78d1442e-ef8d-40c7-b57... testikayttis    EURP190DG091-db031             99 GB (106,300,44... 78d1442e-ef8d-40c7-b57f-a3ce66b36f76
