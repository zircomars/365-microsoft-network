# create new user
this guide can find out at learn.microsoft, just small quick practice at vscode powershell terminal (normal powershell terminal is also good choice)

https://learn.microsoft.com/en-us/powershell/azure/active-directory/new-user-sample?view=azureadps-2.0

this is example for platform if trying create new user, but after creation (when powershell run the script as terminal) then it will receive the user datas and at azure under users at UI, there can edit it anytime. But if like using powershell terminal then need use `set-azureaduser`edit something single object like phone number, address and other properties.

`New-AzureADUser -AccountEnabled $True -DisplayName "<Fullname>" -PasswordProfile $UserProfile -MailNickName "<Full.name>" -CompanyName "<STRING>" -TelephoneNumber "<STRING>" -Mobile "<STRING>" -OtherMails "<STRING>" -UserPrincipalName <firstname>@domainName.onmicrosoft.com`

this can find out at microsoft own documents list anyway

<hr>

`UserProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile`                                                                                
`$UserProfile.Password = <"thePassword">`

`$New-AzureADUser -AccountEnabled $True -DisplayName "Garry Moore" -PasswordProfile $UserProfile -MailNickName "GarryM" -UserPrincipalName <MailNickName>@<directory name>.com`

```
ObjectId                             DisplayName UserPrincipalName                      UserType
--------                             ----------- -----------------                      --------
51a2173e-7d50-4bec-a6eb-b9011d45bcef Garry Moore Garry@domain.onmicrosoft.com           Member
```

<hr>

![Alt text](images/21.png)

![Alt text](images/22-1.png)
