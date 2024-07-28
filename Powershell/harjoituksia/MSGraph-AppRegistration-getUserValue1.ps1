<#
Overview data and this is app registration overview; 
Application (client) ID
: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Object ID
: YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

Directory (tenant) ID
: ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

certificate & secrets, sekä tämä on voimassa oletuksen mukaan n. 6kk (18.7.2024)
Value: QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

Secret ID: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

own azure overview basic information; 
primary domain; domainCompany.onmicrosoft.com

#>

# reply own tenant and prompt user to enter the domain name. This ask user enter their tenant as read user inputs.
$tenant = Read-Host ("Enter the tenant name:")

# at the moments need to access the endpoints (app registration own that: OpenID Connect metadata document), from own script to known token endpoints, this will be use inclined credential flow.
# variable will access particular link, and the value of the tenant is the same value where user will be entering
$openId = Invoke-RestMethod -uri "https://login.microsoftonline.com/$tenant/.well-known/openid-configuration"

# like print a sentences , and like sorted filtered $open.Id.XXXXXX something value
Write-Host "The token endpoint of your endpoints is;"
$openId.token_endpoint


# the access token will display & using client credential flow
$token = $openId.token_endpoint

#client_id as own app registration the "Application (client) ID", client_secret will be the "certificate & secrets" that > "lient secrets "value" id
# declare an object and get multiple set of an informations. Value send 
$Body = @{
    client_id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
    client_secret = "qwertyqwertyqwertyqwertyqwerty"
    redirect_uri = "https://localhost"
    grant_type = "client_credentials"
    resource = "https://graph.microsoft.com"
    #resource = "https://graph.microsoft.com/default" 
    tenant = $tenant
}

Write-Host = "Requesting access token"

# request variable get informations and get the access token value & consisting entire access token
$request = Invoke-RestMethod -uri $token -Body $Body -Method Post
$request.access_token

# query the graph variable going to add the endpoints & using this url for reach users
# the url ask/reach to the particual endpoints & it might have authorization of the access token & thjis works either "v1.0" and "beta"
# $graph = "https://graph.microsoft.com/beta/users"
$graph = "https://graph.microsoft.com/v1.0/users"


# the authorization header which contain the access token, keyword is "bearer" and the value inside the token which when receive.
# this line variable, get line 57 all the users from this endpoint by using this access token. And this variable will get something interesting and in response, and final will display the variable data out. Final sentence will show and give a filtered the value and what user as get the informations data including user's name, fullname, email domain name (first.last@domain.com) and blah blah and read more able like to convert to json format
$api = Invoke-RestMethod -Headers @{Authorization = "Bearer $($request.access_token)"} -uri $graph -Method Get
# optional, but readable; $api.value | select userPrincipalName, accountEnabled | ConvertTo-json

##########################################################################################
###### few output types and how it result looks like, and good practices #######

##### example 1 (two types output one sit like json and other horizontal line, and get first or lasts names with some value from the organization)
# powershell show api.the value | pipeline select-object like show 10 names if organization got over 100 people then -Property like sort "-First" or "-Last" peoples from organization and filtered show as individual like user properties | final readable like "ConvertTo-json" or "Fortmat-Table"
# $api.value | Select-Object -First 10 -Property businessPhones, displayName, mobilePhone, userPrincipalName, id | Format-Table
# $api.value | Select-Object -Last 10 -Property businessPhones, displayName, mobilePhone, userPrincipalName, id | ConvertTo-json


#### example 2 , same as example 1, but display 10 names out of the organization without filtered properties | Format-Table read able type or use "ConvertTo-json" is also fine
#$api.value | Select-Object -First 10 | Format-Table


#### example 3, same as example 1 and 2, just output show and receive all names out of the organization
#$api.value | Format-Table


#### example 4 , (two types) this was the original by following the video tutorial. here "select" as chosen properties item what we want to see and readable now using "convertTo-json"
#$api.value | select userPrincipalName, accountEnabled | convertTo-json
#$api.value | Select-Object -Last 10 -Property businessPhones, displayName, mobilePhone, userPrincipalName, id | Format-Table


Write-Host "#################################################################################################"

### example 5, like export does $api.value what will output to powershell terminal, but as same data and information export to csv (excel sheets). The is same as those other examples, but this example get all users as information from the organization to excel sheets. 
## it would be better check the $api.value - terminal what does there output the data and information out there then open these excel actions commands Because as make sure name or as check those -Property name as subject, what do you want to see as result and more like important data what might be usefull for example another department need to see. e.g. user's informatiosn basic mail, fullname, phonenumbers, access if does have or not and if is filtered names by external users and ect.

# at this app registration > API permissions > set this application and granted "Reports.Read.All"
# More important is -Property is like what data want to see , but not export everything to sheets then will is not readable, get some what might be important, usefull and important data.
# Write-Host "Excel sheets is done check that path"

# open bottom / remove the command mark, then the script can run
#$filteredReport = $api.value | Select-Object -Property UserPrincipalName, businessPhones, displayName, mobilePhone, id, LastActivityDate
#$filteredReport | Export-Csv -Path "C:\Users\zhao-\Documents\ActiveUserReport1.csv" -NoTypeInformation -Encoding UTF8

##############################################################
####### ACCESS TOKEN LIFETIME (START HERE); ##############
### example 6
# microsoft graph access token got lifetime, as default lifetime is assigned a random value ranging between 60-90 minutes (75 minutes on average)
# this lower script as code where calculate and check how long does access token have a lifetime.

# as begin where input and here are going to use again for new query
$accessToken = $request.access_token

# Decode the access token
$tokenParts = $accessToken -split '\.'
$tokenPayload = $tokenParts[1]
$tokenPayload += '=' * ((4 - $tokenPayload.Length % 4) % 4)
$tokenPayloadDecoded = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($tokenPayload))
$tokenPayloadJson = $tokenPayloadDecoded | ConvertFrom-Json

# Display the token lifetime and take the current time this dippend where the programmer/admin lives like us, european and other timezones. But it might automatically will set British timezone
$expiryTime = [datetime]::FromFileTimeUtc($tokenPayloadJson.exp * 10000000 + 116444736000000000)
$currentTime = (Get-Date).ToUniversalTime()
$tokenLifetime = $expiryTime - $currentTime

Write-Host "The access token expires at: $expiryTime UTC"
Write-Host "The token lifetime is: $tokenLifetime"

<# example how much time left (timelife) got this access token and powershell terminal output; 
still no idea is this real or not??

The access token expires at: 07/28/2024 17:06:32 UTC
The token lifetime is: 00:59:59.2405111

#>

















