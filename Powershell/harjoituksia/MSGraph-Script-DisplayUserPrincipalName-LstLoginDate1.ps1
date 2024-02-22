# first at powershell or vscode login as connected
$connect-MgGraph -Scopes 'AuditLog.Read.All'

#write, edit and save the script code (START HERE)
# get the admin center as azure entra id properties user of the data
$Properties = @(
    'UserPrincipalName', 'SignInActivity'  
)

# Get all users along with the properties
$AllUsers = Get-MgUser -All -Property $Properties

# Perform Search, like search user principal name (domain name) like firstname is Mike, (Mike Doe, Mike Chen &...)
$FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "Mike*" }

# Add LastLoginDate property
$FilteredUsers | ForEach-Object {
    $LastLoginDate = $_.SignInActivity.LastSignInDateTime         
    $_ | Add-Member -MemberType NoteProperty -Name LastLoginDate -Value $LastLoginDate
}

# Display UserPrincipalName and LastLoginDate properties
$FilteredUsers | Format-Table UserPrincipalName,LastLoginDate



### AT The terminal (powershell) run the script and display view
PS C:\Users\> $FilteredUsers | Format-Table UserPrincipalName,LastLoginDate

UserPrincipalName                  LastLoginDate
-----------------                  -------------
Mike-John.Smith@domain.fi         13/02/2024 8.59.00
Mike.Doe@domain.fi                13/02/2024 8.59.00
