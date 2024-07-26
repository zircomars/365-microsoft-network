<#
Overview tiedotteet; 
Application (client) ID
: ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

Object ID
: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Directory (tenant) ID
: YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

certificate & secrets, sekä tämä on voimassa oletuksen mukaan n. 6kk (18.7.2024)
Value: QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

Secret ID: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

own azure overview basic information; 
primary domain; domainName.onmicrosoft.com

#>

# reply own tenant and prompt user to enter the domain name. This ask user enter their tenant as read user inputs.
$tenant = Read-Host "Enter the tenant name:"

# Get OpenID configuration
# at the moments need to access the endpoints (app registration own that: OpenID Connect metadata document), from own script to known token endpoints, this will be use inclined credential flow.
# variable will access particular link, and the value of the tenant is the same value where user will be entering
$openId = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenant/.well-known/openid-configuration"

# like print a sentences , and like sorted filtered $open.Id.XXXXXX something value and this is the access token
Write-Host "The token endpoint URL is:"
$openId.token_endpoint

# Obtain an access token & declare an object and get multiple set of an informations. Value send 
$Body = @{
    client_id     = "AZURE_CLIENT-ID"
    client_secret = "AZURE_APPRegistration_SECRET-VALUEID"
    redirect_uri  = "https://localhost"
    grant_type    = "client_credentials"
    resource      = "https://graph.microsoft.com"
    tenant        = $tenant
}

# this try-catch statements is like.. read that user inputs the tenant names, if is correct (own primary doamin name check at portal.azure.com > default directory | overview) 
# that "catch" meaning like else, if is not own azure primary domain then give some error value, but if for example type "microsoft.com" then it will give the microsoft right tenant-id which is real one.
try {
    $request = Invoke-RestMethod -Uri $openId.token_endpoint -Body $Body -Method Post
    $accessToken = $request.access_token
    Write-Host "`nThis is the access token: `n $accessToken"
}
catch {
    Write-Host "Error obtaining access token: $_"
    exit
}

#####################
# Find the group from entra id under as azure portal web or admin center where all group list

# small reminder at this app registration need to add another API permissions object, which is "Group.Read.All" without it, it won't run and find group names. 

Write-Host "`n" # normal new line

# Input parameters
$GroupName = Read-Host "Enter the group name"
$AccessToken = "$accessToken" # this access token need again, because for authorization check the group is in this tenant id inside of the organization

# Microsoft Graph API endpoint for groups for query the graph variable
$GraphApiUrl = "https://graph.microsoft.com/v1.0/groups"

# Make the API request
try {
    $response = Invoke-RestMethod -Uri $GraphApiUrl -Headers @{
        "Authorization" = "Bearer $AccessToken"
    }
    
    # Check if the group exists
    $groupExists = $response.value | Where-Object { $_.displayName -eq $GroupName }
    
    if ($groupExists) {
        Write-Host "Group '$GroupName' exists."
        # Add your additional logic here (e.g., perform specific actions)
    } else {
        Write-Host "Group '$GroupName' does not exist."
        # Add your additional logic here (e.g., display an error message)
    }
} catch {
    Write-Host "Error querying Microsoft Graph API: $($_.Exception.Message)"
}





