# before run these single action command, need to be connect ms-graph sdk first
# small cheat sheet 
$Connect-MgGraph -Scopes "User.Read.All","Group.ReadWrite.All"

<# these is trying to get users (entra ID) as internal organization users details like user when was created time and ect. like as IT support & admin user. Same method if company got external user, there can input & output get external users data as information (when user was last time login, when created time and which company and phone) like a register format. each company got own process.
#>


$Get-MgUser -All -Property CreatedDateTime | select CreatedDateTime  

CreatedDateTime
---------------
3/10/2024 10:48:48 AM
3/10/2024 10:21:32 AM
3/10/2024 10:28:13 AM


#nyt alkaa pikku hiljaa alka tajuta tämän scriptin komennon käyttöä vähäsen, että ilma powershell koodin pätkän rakentamista,
C:\Users\ZT> Get-MgUser -All -Property DisplayName, UserPrincipalName, Mail, CreatedDateTime | select Displayname, UserPrincipalName, Mail, CreatedDateTime

DisplayName       UserPrincipalName                           Mail                  CreatedDateTime
-----------       -----------------                           ----                  ---------------
Anna Kim          Anna@domainName.onmicrosoft.com                             3/10/2024 10:48:48 AM
Constance Wheeler Constance@domainName.onmicrosoft.com                        3/10/2024 10:21:32 AM
Danny Cox         Danny@domainName.onmicrosoft.com                            3/10/2024 10:28:13 AM
Everett Ray       Everett@domainName.onmicrosoft.com                          3/10/2024 10:44:58 AM
Garry Moore       Garry@domainName.onmicrosoft.com      xzcvdfs@gmail.com     3/7/2024 5:18:59 PM
Mark Cavill       Mark@domainName.onmicrosoft.com       asdghjasdg@gmail.com  3/29/2024 12:57:55 PM
Melvin Mendez     Melvin@domainName.onmicrosoft.com                           3/10/2024 11:01:59 AM
Michael Johnson   Michael@domainName.onmicrosoft.com    asdf@gmail.com        2/24/2024 3:49:32 PM
Michelle Evans    Michelle@domainName.onmicrosoft.com   bus_unelayo19@aol.com 3/7/2024 3:03:00 PM
Olivia Hodges     Olivia@domainName.onmicrosoft.com                           3/10/2024 10:51:32 AM
tech pad          local@domainName.onmicrosoft.com                            2/20/2024 8:04:05 AM
Ted Duncan        Ted@domainName.onmicrosoft.com                              3/10/2024 11:02:04 AM


PS C:\Users\ZT> Get-MgUser -All -Property DisplayName, UserPrincipalName, Mail, CreatedDateTime, MobilePhone | Format-Table -Autosize  Displayname, UserPrincipalName, Mail, CreatedDateTime, MobilePhone

DisplayName       UserPrincipalName                           Mail                  CreatedDateTime       MobilePhone
-----------       -----------------                           ----                  ---------------       -----------
Anna Kim          Anna@domainName.onmicrosoft.com                             3/10/2024 10:48:48 AM +1283813197
Constance Wheeler Constance@domainName.onmicrosoft.com                        3/10/2024 10:21:32 AM
Danny Cox         Danny@domainName.onmicrosoft.com                            3/10/2024 10:28:13 AM +15644202057
Everett Ray       Everett@domainName.onmicrosoft.com                          3/10/2024 10:44:58 AM +1475492592
Garry Moore       Garry@domainName.onmicrosoft.com      xzcvdfs@gmail.com     3/7/2024 5:18:59 PM   345671234
Mark Cavill       Mark@domainName.onmicrosoft.com       asdghjasdg@gmail.com  3/29/2024 12:57:55 PM 234623456
Melvin Mendez     Melvin@domainName.onmicrosoft.com                           3/10/2024 11:01:59 AM +948644330
Michael Johnson   Michael@domainName.onmicrosoft.com    asdf@gmail.com        2/24/2024 3:49:32 PM  +16158984936
Michelle Evans    Michelle@domainName.onmicrosoft.com   bus_unelayo19@aol.com 3/7/2024 3:03:00 PM   341-4861-83
Olivia Hodges     Olivia@domainName.onmicrosoft.com                           3/10/2024 10:51:32 AM +1004887319
tech pad          local@domainName.onmicrosoft.com                            2/20/2024 8:04:05 AM
Ted Duncan        Ted@domainName.onmicrosoft.com                              3/10/2024 11:02:04 AM +49912823


# just weird, i got the permissions and got auditlog context where i can check the when user was LastLoginDate, but for the azure entra id free (license), so i can not get logs.
PS C:\Users\ZT> Get-MgUser -All -Property DisplayName, UserPrincipalName, Mail, CreatedDateTime, LastLoginDate,  MobilePhone, CompanyName | Format-Table -Autosize  Displayname, UserPrincipalName, Mail, CreatedDateTime, LastLoginDate, MobilePhone, CompanyName

DisplayName       UserPrincipalName                           Mail                  CreatedDateTime       LastLoginDate MobilePhone  CompanyName
-----------       -----------------                           ----                  ---------------       ------------- -----------  -----------
Anna Kim          Anna@domainName.onmicrosoft.com                             3/10/2024 10:48:48 AM               +1283813197  ZenithPeak
Constance Wheeler Constance@domainName.onmicrosoft.com                        3/10/2024 10:21:32 AM                            ABCD




PS C:\Users\ZT> Get-MgUser -All -Property DisplayName, UserPrincipalName, Mail, CreatedDateTime, MobilePhone, CompanyName | Format-Table -Autosize  Displayname, UserPrincipalName, Mail, CreatedDateTime, MobilePhone, CompanyName

DisplayName       UserPrincipalName                           Mail                  CreatedDateTime       MobilePhone  CompanyName
-----------       -----------------                           ----                  ---------------       -----------  -----------
Anna Kim          Anna@domainName.onmicrosoft.com                             3/10/2024 10:48:48 AM +1283813197  ZenithPeak


# find the excatly who got that characters names as "Mi" words just check the DisplayName characters
PS C:\Users\ZT>  Get-MgUser -Filter "startsWith(DisplayName, 'Mi')"    

DisplayName     Id                                   Mail                  UserPrincipalName
-----------     --                                   ----                  -----------------
Michael Johnson 57a0e02e-cec4-4451-b7fa-asdfsdafsdf3 asdf@gmail.com        Michael@domainName.onmicrosoft.com
Michelle Evans  2221cec9-c618-4657-8e8b-asdfsdafsdf3 bus_unelayo19@aol.com Michelle@domainName.onmicrosoft.com


# check whole who got UserPrincipalName as email domain name got start by "m" word, but if got ext username (ext-FirstName), that wont display
PS C:\Users\ZT>  Get-MgUser -Filter "startsWith(UserPrincipalName, 'm')" 

DisplayName     Id                                   Mail                  UserPrincipalName
-----------     --                                   ----                  -----------------
Mark Cavill     6b60de77-29cc-43eb-abe5-asdfsdafsdf3 asdghjasdg@gmail.com  Mark@domainName.onmicrosoft.com
Melvin Mendez   e52af445-a555-40ca-abfd-asdfsdafsdf3                       Melvin@domainName.onmicrosoft.com
Michael Johnson 57a0e02e-cec4-4451-b7fa-asdfsdafsdf3 asdf@gmail.com        Michael@domainName.onmicrosoft.com
Michelle Evans  2221cec9-c618-4657-8e8b-asdfsdafsdf3 bus_unelayo19@aol.com Michelle@domainName.onmicrosoft.com

---------------------------------------------------
# jatkuu copy-paste

# example export the to excel sheets
PS C:\Users\ZT>  Get-MgUser -Filter "startsWith(UserPrincipalName, 'm')" | export-csv C:\Users\zhao-\Downloads\file1.csv -NoTypeInformation   









