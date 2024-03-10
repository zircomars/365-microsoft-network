# before run this script need to connect-azuread & as using global admin role, or just at script run right away the script, but there might be missing something

Connect-AzureAD
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "<Password>"

New-AzureADUser -AccountEnabled $True -DisplayName "<Fullname>" -PasswordProfile $UserProfile -MailNickName "<Full.name>" -CompanyName "<STRING>" -TelephoneNumber "<STRING>" -Mobile "<STRING>" -OtherMails "<STRING>" -UserPrincipalName <firstname>@domainName.onmicrosoft.com
