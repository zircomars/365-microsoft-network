<# msgraph-getDataAndPushSharepoint
# using vscode + ms graph and run this script get azure user data information and properties
# BEFORE RUN THE SCRIPT; if using ms graph on vscode/powershell ISE scripting app
# login first and login by admin m365 account; connect-MgGraph -Scopes "User.Read.All","Group.ReadWrite.All" 
#>

$Properties = @(
    'UserPrincipalName', 'CompanyName', 'SignInActivity'
)

# Get all users along with the properties
$AllUsers = Get-MgUser -All -Property $Properties

# Perform Search & search user principal name (domain email is start like Matti) and it will display all start Matti or just M* (something e.g. matti, mike, maija, minna & ...)
# $FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "Ext-*" }

$FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "m*" }

# Add LastLoginDate property
$FilteredUsers | ForEach-Object {
    $LastLoginDate = $_.SignInActivity.LastSignInDateTime         
    $_ | Add-Member -MemberType NoteProperty -Name LastLoginDate -Value $LastLoginDate
}

# Display at terminal those --> UserPrincipalName, CompanyName and LastLoginDate properties (BEFORE)
# $FilteredUsers | Format-Table UserPrincipalName,CompanyName,LastLoginDate

<# IF-ELSE STATEMENT, if find out users display else if do not found, just normal echo (START HERE)
# another method is like line 26, which terminal show up find out and filtered names, but this if else statement will if find out will display if does not just normal echo "no users found" 
# if else statements, if "FilteredUsers by word or characters will show up at terminal" , "else if do not found, it will echo "not users found"
# And this if else statements success it will display all users (by search and filtered name "M*"), if rename something else it display and echo "no users found"
#>
if ($FilteredUsers) {
    $FilteredUsers | Format-Table UserPrincipalName,CompanyName,LastLoginDate
    Write-Host "Success"
    #using "echo" or "write-host" both is good choice, just reply if works or else "not found"
} else {
    Write-Host "No users found"
}
