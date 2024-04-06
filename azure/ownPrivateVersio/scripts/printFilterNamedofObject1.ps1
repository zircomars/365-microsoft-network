<# Small introduction info, how this script work

- every organization has its own "ext" nicknames as external users, either they are named at the beginning, middle or end, wherever there is first name.surname and using microsoft/azure Entra id the domain account of the work e-mail.
- It depends on the organization's own process, how they name either "ext", the term has a dot or a dash, e.g. "ext-firstname.lastname", "firstname.lastname-ext", "ext.firstname.lastname" and etc.
  - Or it can be just the first name in the e-mail/account, e.g. firstname@domain.fi & if it's a small company, then maybe you can use the firstname without the lastname (depends on the size of the company)

  - at down there is another same script just added "IF-else" parameter, where check does there external user got access in this group (object id)
#>

# guick cheat sheet command for login to microsoft graph sdk, same as powershell if input the command, it will popup and need authetnication method (optional)
connect-MgGraph -Scopes "User.ReadBasic.All", "Application.ReadWrite.All"

# Get users whose display name starts with 'm', like Mike, Michelle, Michael, Millie & .... but as display name (full name)
# and check use properties (property) as check these data match were what user want to see and needed
# $orgUsers = organizational users
$orgUsers = Get-MgUser -All -Property Id, DisplayName, UserPrincipalName, Mail, CreatedDateTime, LastLoginDate, MobilePhone, CompanyName | Where-Object { $_.UserPrincipalName -like "*ext*" }


# Count the number of users
$userCount = $orgUsers.Count
# Print the number of users to the terminal, e.g. 5 person got starten by m-characters names
Write-Host "Total number of users: $userCount"


# PowerShehll terminal view - print the user names to terminal, but order view format
$orgUsers | Format-Table -AutoSize UserPrincipalName, DisplayName, CompanyName, LastLoginDate, CreatedDateTime, MobilePhone, Mail, AccessGroup

<# powershel terminal view, when run this script (START HERE);
PS C:\Users\ZT\Documents> .\msGraph-practice2.ps1
Total number of users: 8

UserPrincipalName                            DisplayName    CompanyName LastLoginDate CreatedDateTime      MobilePhone   Mail                       AccessGroup
-----------------                            -----------    ----------- ------------- ---------------      -----------   ----                       -----------
Dillion-ext@domainNameHere.onmicrosoft.com Dillon Wolf      dfbvsdfb                    4/6/2024 7:21:17 AM  +23457623     uioletr@cvb.org
Edison.ext@domainNameHere.onmicrosoft.com  Edison Owen      fgbdcvb                     4/6/2024 7:22:46 AM  +8723165      sbdfbsdfb@kh.org
ext-Mikko@domainNameHere.onmicrosoft.com   Mikko Niemi      xcvbcvxbcv                  4/3/2024 2:31:47 PM  +453412589734 xcvxc.sda123f@gmail.com
ext-moses@domainNameHere.onmicrosoft.com   Moses Chen       sdgwert                     4/5/2024 12:05:09 PM +4567465123   ksdgjdf@awert.org
ext-Paul@domainNameHere.onmicrosoft.com    Paul Red         asdfsdaf                    4/3/2024 2:22:22 PM  +2934857123   erkgtjherwteqwer@gmail.com
ext-Pekka@domainNameHere.onmicrosoft.com   Pekka Virtanen   sdlfgjsdlfk                 4/3/2024 2:23:11 PM  +358123568    asdfkehjr@fasdf.fi
ext.Laura@domainNameHere.onmicrosoft.com   Laura Beck       wdfbwdfg                    4/6/2024 7:24:03 AM  +8973214      asdcvlkqe@adc.net
Karen.ext@domainNameHere.onmicrosoft.com   Karen Sparks     qwerwezxcv                  4/6/2024 7:19:44 AM  +978012       sdfgsdv@sdf.fi

#>


#####################################################################################################################################

# Same as above, but add a certain group object id that you want to check if these "ext" people are inside this group, and the basic normal either "access" or "denied"

# guick cheat sheet command for login to microsoft graph sdk, same as powershell if input the command, it will popup and need authetnication method (optional)
connect-MgGraph -Scopes "User.ReadBasic.All", "Application.ReadWrite.All"

# Get users whose display name starts with 'm', like Mike, Michelle, Michael, Millie & .... but as display name (full name)
# and check use properties (property) as check these data match were what user want to see and needed
# $orgUsers = organizational users
$orgUsers = Get-MgUser -All -Property Id, DisplayName, UserPrincipalName, Mail, CreatedDateTime, LastLoginDate, MobilePhone, CompanyName | Where-Object { $_.UserPrincipalName -like "*ext*" }


# Count the number of users
$userCount = $orgUsers.Count
# Print the number of users to the terminal, e.g. 5 person got starten by m-characters names
Write-Host "Total number of users: $userCount"


# IF-ELSE PARAMETERS (START HERE);
# get the azure group id (object id) if user are in the group as permissions
# Get the group members & this is same as azure(s) portal id (object id) & the function will check as "users" if got this access will say "access" or other wise do not have have normal "denied"
$GroupMembers = Get-MgGroupMember -GroupId "asdfsdf-1234-c"
# Add AccessGroup (VPN access) property
$orgUsers | ForEach-Object {
    if ($GroupMembers.Id -contains $_.Id) {
        $_ | Add-Member -MemberType NoteProperty -Name AccessGroup -Value "Access"
    } else {
        $_ | Add-Member -MemberType NoteProperty -Name AccessGroup -Value "Denied"
    }
}

# PowerShehll terminal view - print the user names to terminal, but order view format
$orgUsers | Format-Table -AutoSize UserPrincipalName, DisplayName, CompanyName, LastLoginDate, CreatedDateTime, MobilePhone, Mail, AccessGroup

<# powershel terminal view, when run this script (START HERE);

PS C:\Users\zhao-\Documents> .\msGraph-practice2.ps1
Total number of users: 8

UserPrincipalName                            DisplayName    CompanyName LastLoginDate CreatedDateTime      MobilePhone   Mail                       AccessGroup
-----------------                            -----------    ----------- ------------- ---------------      -----------   ----                       -----------
Dillion-ext@domainNameHere.onmicrosoft.com   Dillon Wolf    dfbvsdfb                  4/6/2024 7:21:17 AM  +23457623     uioletr@cvb.org            Denied
Edison.ext@domainNameHere.onmicrosoft.com    Edison Owen    fgbdcvb                   4/6/2024 7:22:46 AM  +8723165      sbdfbsdfb@kh.org           Denied
ext-Mikko@domainNameHere.onmicrosoft.com     Mikko Niemi    xcvbcvxbcv                4/3/2024 2:31:47 PM  +453412589734 xcvxc.sda123f@gmail.com    Access
ext-moses@domainNameHere.onmicrosoft.com     Moses Chen     sdgwert                   4/5/2024 12:05:09 PM +4567465123   ksdgjdf@awert.org          Access
ext-Paul@domainNameHere.onmicrosoft.com      Paul Red       asdfsdaf                  4/3/2024 2:22:22 PM  +2934857123   erkgtjherwteqwer@gmail.com Access
ext-Pekka@domainNameHere.onmicrosoft.com     Pekka Virtanen sdlfgjsdlfk               4/3/2024 2:23:11 PM  +358123568    asdfkehjr@fasdf.fi         Access
ext.Laura@domainNameHere.onmicrosoft.com     Laura Beck     wdfbwdfg                  4/6/2024 7:24:03 AM  +8973214      asdcvlkqe@adc.net          Denied
Karen.ext@domainNameHere.onmicrosoft.com     Karen Sparks   qwerwezxcv                4/6/2024 7:19:44 AM  +978012       sdfgsdv@sdf.fi             Denied


#>


