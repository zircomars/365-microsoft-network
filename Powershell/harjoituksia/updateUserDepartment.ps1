#set the user work domain account, and set the department object
$Set-AzureADUser -ObjectId john.doe@domain.fi -Department "HR"

# and check for the update and filtered version
$Get-AzureADUser -ObjectId john.doe@domain.fi | select Department, CompanyName

Department CompanyName
---------- -----------
HR         Training
