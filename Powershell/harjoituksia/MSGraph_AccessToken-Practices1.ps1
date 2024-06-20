testi-app overview;
Application (client) ID: <client-ID>
Object ID: <Object-ID>
Directory (tenant) ID: <Azure-tenant-ID>
Clientsecret (cert value)= "<App-Registration_Certificate-Secret_Value-ID>"

## kaikki kommennot ja scriptit (START HERE);
$clientid = "<client-ID>"
$tenantid = "<Object-ID>"
$clientsecret = "<App-Registration_Certificate-Secret_Value-ID>"
$uri = "https://login.microsoftonline.com/$tenantid/oauth2/v2.0/token"
$uri

# reply $uri code just edit and added tenant id to middle the url
https://login.microsoftonline.com/<client-ID>/oauth2/v2.0/token


$body = "scope=https://graph.microsoft.com/.default&client_id=$clientid&grant_type=client_credentials &client_secret={0}" -f [System.Net.WebUtility]::UrlEncode($clientsecret)

(haettaan scope ja kaikki oikeudet mitä löytyy microsoft graphilta, oikeudesta kuten read.user)
$body
scope=https://graph.microsoft.com/.default&client_id=<Azure-tenant-ID>&grant_type=client_credentials &client_secret=<App-Registration_Certificate-Secret_Value-ID>

<# mitä tässä urlissa oikein lukee?
- client_id=<Azure-tenant-ID> - oma azure ad tenant id
- grant_type=client_credentials &client_secret=<App-Registration_Certificate-Secret_Value-ID> - oman tämä app registration johon ollaan kirjauduttu että certificate & secret value id, joka on UI:sta & sekä saadaan KUKA käyttäjä ja access token tiedot johon voidaan lähettää se sivustolle/selaimeen

tämä ei vain lähetä plain text mutta joku http enter ID (alhaalla oleva komento)
#>

# this is like active the application process (maybe)
$token = Invoke-RestMethod -Method Post -Uri $uri -Body $body -ContentType "application/x-www-form-urlencoded" -ErrorAction Stop

# there can reply that string as $token but it will input that long access token
$token

# convert to json format, so readable
$token | ConvertTo-Json
{
  "token_type": "Bearer",
  "expires_in": 3599,
  "ext_expires_in": 3599,
  "access_token": "LONG ACCESS TOKEN LOREM IPSUIM"
}


# kopsaa toi "access_token" tai joko kommennolla voi kopsata sen (tricky/magic)

$token.access_token |set-clipboard


#continue, send request to microsoft graph / or use postman or other others
# continue to invoke rest method

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users" -Headers @{Authorization = "Bearer $( $token.access_token)"}

# error why?? BECAUSE; api permission was missing (USER.READ.ALL)
PS C:\Users\zt-> Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users" -Headers @{Authorization = "Bearer $( $token.access_token)"}
Invoke-RestMethod:                                                                                                      
{
  "error": {
    "code": "Authorization_RequestDenied",
    "message": "Insufficient privileges to complete the operation.",
    "innerError": {
      "date": "2024-06-14T18:10:15",
      "request-id": "SOME-REQUEST-ID",
      "client-request-id": "SOME-REQUEST-ID"
    }
  }
}

# finally, but this command is like can used once, then again it will say token is expired & this command plus @data.context
$Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users" -Headers @{Authorization = "Bearer $( $token.access_token)"}

@odata.context                                   value
--------------                                   -----
https://graph.microsoft.com/v1.0/$metadata#users {@{businessPhones=System.Object[]; displayName=Anna Kim; givenName=; jobTitle=; mail=; mobilePhone=+1283813197; officeLocation=; preferredLanguage=; surname=; userPrincipalName=Ann… 


PS C:\Users\zt-> Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users" -Headers @{Authorization = "Bearer $( $token.access_token)"}
Invoke-RestMethod:                                                                                                      
{
  "error": {
    "code": "InvalidAuthenticationToken",
    "message": "Lifetime validation failed, the token is expired.",
    "innerError": {
      "date": "2024-06-15T12:52:31",
      "request-id": "SOME-REQUEST-ID",
      "client-request-id": "SOME-REQUEST-ID"
    }
  }
}

$t = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users" -Headers @{Authorization = "Bearer $( $token.access_token)"}

# some kind of data (something nice) & show sort of users
PS C:\Users\zt-> $t.value

businessPhones    : {+1772042445}
displayName       : Anna Kim
givenName         : 
jobTitle          : 
mail              : 
mobilePhone       : +1283813197
officeLocation    : 
preferredLanguage : 
surname           : 
userPrincipalName : Anna@domainName.onmicrosoft.com
id                : 2611e3c8-7255-4778-be0e-b1dbae06d3ab

businessPhones    : {}
displayName       : Charlie Mono
givenName         : Charlie
jobTitle          : 
mail              : sdfgdfsgvb@gmail.com
mobilePhone       : +98547645
officeLocation    : 
preferredLanguage : 
surname           : Mono
userPrincipalName : Charlie@domainName.onmicrosoft.com
id                : 2611e3c8-7255-4778-be0e-b1dbae06d3ab

businessPhones    : {}
displayName       : Constance Wheeler
givenName         : 
jobTitle          : 
mail              : 
mobilePhone       : 
officeLocation    : 
preferredLanguage : 
surname           : 
userPrincipalName : Constance@domainName.onmicrosoft.com
id                : 2611e3c8-7255-4778-be0e-b1dbae06d3ab

businessPhones    : {+14433422911}
displayName       : Danny Cox
givenName         : 
jobTitle          : 
mail              : 
mobilePhone       : +15644202057
officeLocation    : 
preferredLanguage : 
surname           : 
userPrincipalName : Danny@domainName.onmicrosoft.com
id                : 2611e3c8-7255-4778-be0e-b1dbae06d3ab



PS C:\Users\zt-> $t.value | select displayname

displayName
-----------
Anna Kim
Charlie Mono
Constance Wheeler
Danny Cox
Dillon Wolf
Edison Owen
Everett Ray
Mikko Niemi
Moses Chen
Paul Red
Pekka Virtanen
Laura Beck
Garry Moore
jack Daniels
Karen Sparks
Mark Cavill
Melvin Mendez
Michael Johnson
Michelle Evans
Olivia Hodges
tech pad
Ted Duncan
zt Shadows
zt Shadows


# app registration (add API permission (group.read.all) from microsoft graph and grand it) & nothing suprised so there is no group but it probably will get update to jwt.ms. uri behind there is where want to display something on microsoft for own azure ad like users or groups and ect
PS C:\Users\zt-> $t = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/groups" -Headers @{Authorization = "Bearer $( $token.access_token)"}
Invoke-RestMethod:                                                                                                      
{
  "error": {
    "code": "Authorization_RequestDenied",
    "message": "Insufficient privileges to complete the operation.",
    "innerError": {
      "date": "2024-06-15T13:40:54",
      "request-id": "SOME-REQUEST-ID",
      "client-request-id": "SOME-REQUEST-ID"
    }
  }
}
PS C:\Users\zt->

# this erroraction stop is like reaction/reset/active the process, but invoke-restmethod got timelimited then it will expiring so when run again the same command then it will expiring
PS C:\Users\zt-> $token = Invoke-RestMethod -Method Post -Uri $uri -Body $body -ContentType "application/x-www-form-urlencoded" -ErrorAction Stop 

# copy the access token
PS C:\Users\zt-> $token.access_token |set-clipboard


# check the groups and here we got it!! azuer ad groups is here & this displayname is like display the of the group name. like group1, group2 and ect
PS C:\Users\zt-> $t = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/groups" -Headers @{Authorization = "Bearer $( $token.access_token)"}
PS C:\Users\zt-> $t.value | select displayname

displayName
-----------
Ext-terminal
o365-group-2
team-2
o365-group-1
team-1
KAIKKI osasto
team-3
MGTiimiAlpha


# cae ID (continuous acces evalutions) 
# toiken revoke, token will tent to enter ID again

<# expiring time & 1h about, after 1hour need to rely on a refresh token instead and the refresh token.

access token maximium expiring is 24h, but maxim is 10minutes, but the default is 1h. 

for saving the access token it suggest the refresh token which is longer like 14 days.

microsoft graph access token upgrade is importantn if need to continue the operations/servers and if want to continue there need to do the authentication, so without the authentication it will sucks.

How to do the authentication and upgrade the access token like do the refresh? do this command; Connect-MgGraph -Scopes "User.Read.All", "Group.ReadWrite.All"

it is like login the scopes or as login to microsoft graph 

"iat": 1718458652,
"nbf": 1718458652,
"exp": 1718462552,
#>

# more of details of the groups & i cutted half of piece, lazy read all lines
PS C:\Users\zt-> $t.value

id                            : 123456789-1234-1234-1234-123456789
deletedDateTime               : 
classification                : 
createdDateTime               : 4/5/2024 12:03:09 PM
creationOptions               : {}
description                   : ext-tiimi
displayName                   : Ext-terminal
expirationDateTime            : 
groupTypes                    : {}
isAssignableToRole            : 
mail                          : 
mailEnabled                   : False
mailNickname                  : 85a74c37-1
membershipRule                : 
membershipRuleProcessingState : 
onPremisesDomainName          : 
onPremisesLastSyncDateTime    : 
onPremisesNetBiosName         : 
onPremisesSamAccountName      : 
onPremisesSecurityIdentifier  : 
onPremisesSyncEnabled         : 
preferredDataLocation         : 
preferredLanguage             : 
proxyAddresses                : {}
renewedDateTime               : 4/5/2024 12:03:09 PM
resourceBehaviorOptions       : {}
resourceProvisioningOptions   : {}
securityEnabled               : True
securityIdentifier            : S-1-12-1-123456789-123456789-123456789-123456789
theme                         : 
uniqueName                    : 
visibility                    : 
onPremisesProvisioningErrors  : {}
serviceProvisioningErrors     : {}

id                            : 2611e3c8-7255-4778-be0e-b1dbae06d3ab
deletedDateTime               : 
classification                : 
createdDateTime               : 3/10/2024 2:01:10 PM
creationOptions               : {}
description                   : toinen koko tiimi
displayName                   : o365-group-2
expirationDateTime            : 
groupTypes                    : {Unified}
isAssignableToRole            : 
mail                          : bravo@domainName.onmicrosoft.com
mailEnabled                   : True
mailNickname                  : bravo
membershipRule                : 
membershipRuleProcessingState : 
onPremisesDomainName          : 
onPremisesLastSyncDateTime    : 
onPremisesNetBiosName         : 
onPremisesSamAccountName      : 
onPremisesSecurityIdentifier  : 
onPremisesSyncEnabled         : 
preferredDataLocation         : 
preferredLanguage             : 
proxyAddresses                : {SMTP:bravo@domainName.onmicrosoft.com}
renewedDateTime               : 3/10/2024 2:01:10 PM
resourceBehaviorOptions       : {}
resourceProvisioningOptions   : {}
securityEnabled               : True
securityIdentifier            : S-1-12-1-123456789-123456789-123456789-123456789
theme                         : 
uniqueName                    : 
visibility                    : Private
onPremisesProvisioningErrors  : {}
serviceProvisioningErrors     : {}

id                            : 2611e3c8-7255-4778-be0e-b1dbae06d3ab
deletedDateTime               : 
classification                : 
createdDateTime               : 3/10/2024 1:32:15 PM
creationOptions               : {}
description                   : I ordered a new laptop case yesterday.
displayName                   : team-2
expirationDateTime            : 
groupTypes                    : {}
isAssignableToRole            : 
mail                          : 
mailEnabled                   : False
mailNickname                  : 5e5bac0d-1
membershipRule                : 
membershipRuleProcessingState : 
onPremisesDomainName          : 
onPremisesLastSyncDateTime    : 
onPremisesNetBiosName         : 
onPremisesSamAccountName      : 
onPremisesSecurityIdentifier  : 
onPremisesSyncEnabled         : 
preferredDataLocation         : 
preferredLanguage             : 
proxyAddresses                : {}
renewedDateTime               : 3/10/2024 1:32:15 PM
resourceBehaviorOptions       : {}
resourceProvisioningOptions   : {}
securityEnabled               : True
securityIdentifier            : S-1-12-1-123456789-123456789-123456789-123456789
theme                         : 
uniqueName                    : 
visibility                    : 
onPremisesProvisioningErrors  : {}
serviceProvisioningErrors     : {}

id                            : 2611e3c8-7255-4778-be0e-b1dbae06d3ab
deletedDateTime               : 
classification                : 
createdDateTime               : 3/10/2024 2:00:38 PM
creationOptions               : {}
description                   : koko tiimi
displayName                   : o365-group-1
expirationDateTime            : 
groupTypes                    : {Unified}
isAssignableToRole            : 
mail                          : alpha@domainName.onmicrosoft.com
mailEnabled                   : True
mailNickname                  : alpha
membershipRule                : 
membershipRuleProcessingState : 
onPremisesDomainName          : 
onPremisesLastSyncDateTime    : 
onPremisesNetBiosName         : 
onPremisesSamAccountName      : 
onPremisesSecurityIdentifier  : 
onPremisesSyncEnabled         : 
preferredDataLocation         : 
preferredLanguage             : 
proxyAddresses                : {SMTP:alpha@domainName.onmicrosoft.com}
renewedDateTime               : 3/10/2024 2:00:38 PM
resourceBehaviorOptions       : {}
resourceProvisioningOptions   : {}
securityEnabled               : True
securityIdentifier            : S-1-12-1-123456789-123456789-123456789-123456789
theme                         : 
uniqueName                    : 
visibility                    : Private
onPremisesProvisioningErrors  : {}
serviceProvisioningErrors     : {}


<# refresth access token test (START HERE); LET'S TRY WAIT 10MINUTES ABOUT 
# it's not 10minutes, it's following by default time as 1h then the token will going to expire.
when times run like over 1h then the access token will be expired, but not excatly 1h might 1h 10minutes or 1h 30 minutes
after that how to refresh/update the token? while when is expired, if is checking "users" then can get display like get azure ad users names, principal names (email domains) and other users properties, including guest and external users names and domains. 

but if changes to uri to check "groups" then it won't work without the updated/refresh token access.
#>

PS C:\Users\zt-> Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users" -Headers @{Authorization = "Bearer $( $token.access_token)"}
Invoke-RestMethod: 
{
  "error": {
    "code": "InvalidAuthenticationToken",
    "message": "Lifetime validation failed, the token is expired.",
    "innerError": {
      "date": "2024-06-17T08:15:22",
      "request-id": "SOME-REQUEST-ID",
      "client-request-id": "SOME-REQUEST-ID"
    }
  }
}

# this command update the token and afterr that it will show and display the access token format
PS C:\Users\zt-> $token = Invoke-RestMethod -Method Post -Uri $uri -Body $body -ContentType "application/x-www-form-urlencoded" -ErrorAction Stop
PS C:\Users\zt-> Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users" -Headers @{Authorization = "Bearer $( $token.access_token)"}    

@odata.context                                   value
--------------                                   -----
https://graph.microsoft.com/v1.0/$metadata#users {@{businessPhones=System.Object[]; displayName=Anna Kim; givenName=; jobTitle=; mail=; mobilePhone=+1283813197; officeLocation=; preferredLanguage=; surname=; userPrincipalName=Ann… 

PS C:\Users\zt-> $token | convertTo-Json
{
  "token_type": "Bearer",
  "expires_in": 3599,
  "ext_expires_in": 3599,
  "access_token": "LONG ACCESS TOKEN LOREM IPSUIM"
}
