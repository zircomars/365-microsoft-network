<# msgraph-getDataAndPushSharepoint
# using vscode + ms graph and run this script get azure user data information and properties
# BEFORE RUN THE SCRIPT; if using ms graph on vscode/powershell ISE scripting app
# login first and login by admin m365 account; connect-MgGraph -Scopes "User.Read.All","Group.ReadWrite.All" 
#>

$Properties = @(
    'UserPrincipalName', 'DisplayName', 'CompanyName', 'SignInActivity', 'CreatedDateTime', 'BusinessPhones', 'OtherMails'
)

# Get all users along with the properties
$AllUsers = Get-MgUser -All -Property $Properties

# Perform Search & search user principal name (domain email is start like Matti) and it will display all start Matti or just M* (something e.g. matti, mike, maija, minna & ...)
# $FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "Ext-*" }
# display the users
$FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "M-*" }

# Add LastLoginDate property
$FilteredUsers | ForEach-Object {
    $LastLoginDate = $_.SignInActivity.LastSignInDateTime         
    $_ | Add-Member -MemberType NoteProperty -Name LastLoginDate -Value $LastLoginDate
}


###############################################################

<# 
if else statements (START HERE)

This "if-else statement" check at azure portal named group and object id value, at same time check these named person who got access this group/permission. E.g. in this group -> these named (J*) words people got the access or not (denied).

# admin-team1 group id; "A98DB9-73KWL8XP-1LZ94KJF0BM"
# vpn group id; "1JZYI5H7-ASAIEQO4J0-VS0CM1S"
#>
# Get the group members
$GroupMembers = Get-MgGroupMember -GroupId "UUTXM-RW7QP0TVQ-7RCBYQ5YS18"

# Add AccessGroup (VPN access) property
$FilteredUsers | ForEach-Object {
    if ($GroupMembers.Id -contains $_.Id) {
        $_ | Add-Member -MemberType NoteProperty -Name AccessGroup -Value "Access"
    } else {
        $_ | Add-Member -MemberType NoteProperty -Name AccessGroup -Value "Denied"
    }
}

$FilteredUsers | Format-Table -AutoSize UserPrincipalName, DisplayName, CompanyName, LastLoginDate, CreatedDateTime, BusinessPhones, TelephoneNumber, OtherMails, AccessGroup

#######################################
<# TERMINAL DISPLAY VIEW
PS C:\Users\ZT\> .\MSGraph-DisplayUserIFELSE-GroupMembers.ps1

UserPrincipalName                  DisplayName        CompanyName     LastLoginDate       CreatedDateTime     BusinessPhones    OtherMails                   AccessGroup
-----------------                  -----------        -----------     -------------       ---------------     --------------    ----------                   -----------
ext-Mike.Doe@domain.fi             Mike Doe           CompAny         13/02/2024 8.59.00  09/11/2023 13.08.48 {+123 555}        {}                           Access
ext-Michelle.Doe@domain.fi         Michelle Doe                       28/02/2022 15.31.16 06/10/2021 5.47.05  {}                {}                           Denied
#>
