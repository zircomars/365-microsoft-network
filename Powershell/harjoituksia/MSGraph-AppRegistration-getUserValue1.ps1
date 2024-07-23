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

##############
# few output types and how it result looks like, and good practices

## example 1 (two types output one sit like json and other horizontal line, and get first or lasts names with some value from the organization)
# powershell show api.the value | pipeline select-object like show 10 names if organization got over 100 people then -Property like sort "-First" or "-Last" peoples from organization and filtered show as individual like user properties | final readable like "ConvertTo-json" or "Fortmat-Table"
# $api.value | Select-Object -First 10 -Property businessPhones, displayName, mobilePhone, userPrincipalName, id | Format-Table
# $api.value | Select-Object -Last 10 -Property businessPhones, displayName, mobilePhone, userPrincipalName, id | ConvertTo-json


#### example 2 , same as example 1, but display 10 names out of the organization without filtered properties | Format-Table read able type or use "ConvertTo-json" is also fine
#$api.value | Select-Object -First 10 | Format-Table


#### example 3, same as example 1 and 2, just output show and receive all names out of the organization
#$api.value | Format-Table


### example 4 , this was the original by following the video tutorial. here "select" as chosen properties item what we want to see and readable now using "convertTo-json"
#$api.value | select userPrincipalName, accountEnabled | convertTo-json

$api.value | Select-Object -Last 10 -Property businessPhones, displayName, mobilePhone, userPrincipalName, id | Format-Table




