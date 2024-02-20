# for example get all users from azure ad user list / admin center list, where user principal name start or like *ext-*, as format list show their department, display name and company name. Ext like external person, and there got over 5 person names, if "wildcode is like empty

$Get-AzureADUser -All $true | Where-Object {$_.UserPrincipalName -like "ext-*"} | Format-List UserPrincipalName, DisplayName, CompanyName

UserPrincipalName : ext-john-doe@domain.fi
DisplayName       : john doe
CompanyName       : TeamSupport

....

UserPrincipalName : ext-Wiliam.Vodka@company.fi
DisplayName       : William Vodka
CompanyName       : Wilcode
