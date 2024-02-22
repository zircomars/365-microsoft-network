# same as another script (/MSGraph-Script-DisplayUserPrincipalName-LstLoginDate1.ps1)
# but this add just companyName, like if at admin center got guest or external users, will be added to like a small information

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



######terminal display example and saved script
S C:\Users\ZT> .\MSGraph_getUser_lastLoginDate2.ps1

UserPrincipalName                  CompanyName     LastLoginDate
-----------------                  -----------     -------------
Mike-John.Doe@domain.fi      Company2              13/02/2024 8.59.00
Mike.Smith@domain.fi       Company1                21/02/2024 5.55.00

###############################
# another example export those datat to csv file, like show it to colleague or work partner

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

# Export UserPrincipalName, CompanyName and LastLoginDate properties to a CSV file
$FilteredUsers | Select-Object UserPrincipalName,CompanyName,LastLoginDate | Export-Csv -Path C:\path\to\yourfile.csv -NoTypeInformation








