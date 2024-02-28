<# msgraph-getDataAndPushSharepoint
# this script is same as "MSGraph_getUser_lastLoginDate1.ps1" first one, but this will be like example base
# using vscode + ms graph and run this script get azure user data information and properties
# BEFORE RUN THE SCRIPT; if using ms graph on vscode/powershell ISE scripting app
# login first and login by admin m365 account; connect-MgGraph -Scopes "User.Read.All","Group.ReadWrite.All" 
#>

$Properties = @(
    'UserPrincipalName', 'CompanyName', 'SignInActivity'  
)

# Get all users along with the properties
$AllUsers = Get-MgUser -All -Property $Properties

# Perform Search
$FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "Mike*" }

# Add LastLoginDate property
$FilteredUsers | ForEach-Object {
    $LastLoginDate = $_.SignInActivity.LastSignInDateTime         
    $_ | Add-Member -MemberType NoteProperty -Name LastLoginDate -Value $LastLoginDate
}

# Display UserPrincipalName, CompanyName and LastLoginDate properties
$FilteredUsers | Format-Table UserPrincipalName,CompanyName,LastLoginDate

###############################
<# terminal view
PS C:\Users\ZhaoTan\OneDrive - codemen.fi\2024\tammi-helmi> .\msgraph_getuser_lastloginDate2.ps1

UserPrincipalName                  CompanyName     LastLoginDate
-----------------                  -----------     -------------
ext-John.Doe@codemen.fi            CompAny          13/02/2024 8.59.00
ext-Jane.Doe@codemen.fi            BGPAT            27/02/2024 14.16.12
.....
#>

###############################
# another example export those datat to csv file, like show it to colleague or work partner

$Properties = @(
    'UserPrincipalName', 'CompanyName', 'SignInActivity'  
)

# Get all users along with the properties
$AllUsers = Get-MgUser -All -Property $Properties

# Perform Search
# search user principal name (domain email is start like Mike) and it will display all start Mike or like who start M names (something e.g. Mike, Michael, Mindy & ...)
$FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "Mike*" }

# Add LastLoginDate property
$FilteredUsers | ForEach-Object {
    $LastLoginDate = $_.SignInActivity.LastSignInDateTime         
    $_ | Add-Member -MemberType NoteProperty -Name LastLoginDate -Value $LastLoginDate
}

# Export UserPrincipalName, CompanyName and LastLoginDate properties to a CSV file
$FilteredUsers | Select-Object UserPrincipalName,CompanyName,LastLoginDate | Export-Csv -Path C:\path\to\yourfile.csv -NoTypeInformation








