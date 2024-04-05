# guick cheat sheet command for login to microsoft graph sdk, same as powershell if input the command, it will popup and need authetnication method (optional)
connect-MgGraph -Scopes "User.ReadBasic.All", "Application.ReadWrite.All"


# Get users whose display name starts with 'm', like Mike, Michelle, Michael, Millie & .... but as display name (full name)
# and check use properties (property) as check these data match were what user want to see and needed
$users = Get-MgUser -All -Property DisplayName, UserPrincipalName, Mail, CreatedDateTime, LastLoginDate, MobilePhone, CompanyName  -Filter "startswith(displayName, 'm')"

# Count the number of users
$userCount = $users.Count
# Print the number of users to the terminal, e.g. 5 person got starten by m-characters names
Write-Host "Total number of users: $userCount"

# Print the user names to terminal, but order view format
$users | Format-Table -AutoSize UserPrincipalName, DisplayName, CompanyName, LastLoginDate, CreatedDateTime, MobilePhone, Mail

<# powershell terminal view e.g. z* words as check own name and all details;
# small warning at portal.azure.com -> under the user (first lastname) -> Properties, (contact information )-> "Email" is so different as PowerShell script, because it's written "Mail" not "Email".

PS C:\Users\ZT\Documents> .\msGraph-practice2.ps1
Total number of users: 1

UserPrincipalName                           DisplayName CompanyName LastLoginDate CreatedDateTime      BusinessPhones MobilePhone Mail
-----------------                           ----------- ----------- ------------- ---------------      -------------- ----------- ----
z.t@domainName.onmicrosoft.com zhao admin  asdlasdj                  2/23/2024 6:48:22 PM                2435986734  lsdfjghdfsg@hadf.org

#>
