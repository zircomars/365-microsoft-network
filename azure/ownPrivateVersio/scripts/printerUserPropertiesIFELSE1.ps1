<# Small introduction info, how this script work
- this script check organization all the list as all users without filtered by name like single alphabet words like S-characters all names (Sam, Samuel, Sandy and ect), this is why added the commands.
- counter the users, normally check all users as how many people will be showed to at powershell terminal. if filtered and get search by named, so it will be less, but now all in the organization all users.

- at If-else parameters check the group object id (as azure portal group's id), for example "sale team 1" - check whole users and scan the this group object id names, these user are in this group normal "access", else if are not then "denied".
- also at if-else parameter got the function normal check reply the at end, so x - user access printed out, y - user denied printed out and ect at lines.

- if organization got external user, then can filtered user by only get all "ext" user names (check "displayname") if match.

#>

# guick cheat sheet command for login to microsoft graph sdk, same as powershell if input the command, it will popup and need authetnication method (optional)
connect-MgGraph -Scopes "User.ReadBasic.All", "Application.ReadWrite.All"

# Get users whose display name starts with 'm', like Mike, Michelle, Michael, Millie & .... but as display name (full name)
# and check use properties (property) as check these data match were what user want to see and needed
# $orgUsers = organizational users & without filter check all user names whole in Azure Entra ID whole organization names
$orgUsers = Get-MgUser -All -Property Id, DisplayName, UserPrincipalName, Mail, CreatedDateTime, LastLoginDate, MobilePhone, CompanyName  # -Filter "startswith(displayName, 'm')"

# Count the number of users
$userCount = $orgUsers.Count
# Print the number of users to the terminal, e.g. 5 person got starten by m-characters names
Write-Host "Total number of users: $userCount"


# IF-ELSE PARAMETERS (START HERE);
# get the azure group id (object id) if user are in the group as permissions
# Get the group members & this is same as azure(s) portal id (object id) & the function will check as "users" if got this access will say "access" or other wise do not have have normal "denied"

$GroupMembers = Get-MgGroupMember -GroupId "wsdfbvdfwsg-1234"

# Add AccessGroup (group access) property
$orgUsers | ForEach-Object {
    if ($GroupMembers.Id -contains $_.Id) {
        $_ | Add-Member -MemberType NoteProperty -Name AccessGroup -Value "Access"
    } else {
        $_ | Add-Member -MemberType NoteProperty -Name AccessGroup -Value "Denied"
    }
}

# Print the user names to terminal, but order view format
$orgUsers | Format-Table -AutoSize UserPrincipalName, DisplayName, CompanyName, LastLoginDate, CreatedDateTime, MobilePhone, Mail, AccessGroup

<# powershell terminal view e.g. z* words as check own name and all details;
# small warning at portal.azure.com -> under the user (zhao admin) -> Properties, (contact information )-> "Email" is so different as PowerShell script, because it's written "Mail" not "Email".

PS C:\Users\ZT\Documents> .\msGraph-practice2.ps1
Total number of users: 8

UserPrincipalName                           DisplayName       CompanyName  LastLoginDate CreatedDateTime       MobilePhone   Mail                       AccessGroup
-----------------                           -----------       -----------  ------------- ---------------       -----------   ----                       -----------
Anna@domainName.onmicrosoft.com             Anna Kim          ZenithPeak                  3/10/2024 10:48:48 AM +1283813197                              Access
Charlie@domainName.onmicrosoft.com          Charlie Mono      sdfgdsfgsdfg                4/5/2024 10:05:55 AM  +98547645     sdfgdfsgvb@gmail.com       Denied
ext-Mikko@domainName.onmicrosoft.com        Mikko Niemi       xcvbcvxbcv                 4/3/2024 2:31:47 PM   +453412589734  xcvxc.sda123f@gmail.com    Denied
....
#>

