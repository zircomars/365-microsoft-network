#Get all admin center as azureAD user list, and filtered like output user principle name (work account domain), displayname and with department
# this output will give around 50 people, but if got more than 100 or 150 it will can not show up.. some kind of a range

$Get-AzureADUser | select userprincipalname, displayname, department

UserPrincipalName                                               DisplayName                  Department
-----------------                                               -----------                  ----------

# another example
$Get-AzureADUser | Select-Object -Property userprincipalname, displayname, department

UserPrincipalName                                               DisplayName                  Department
-----------------                                               -----------                  ----------

# but if want to get ALL users then must be add '-all $true' parameters front of the Get-AzureADUser, then it will give export out over 100 users (if got that so much)

$Get-AzureADUser -All $true | Select-Object -Property userprincipalname, displayname, department
UserPrincipalName                                                         DisplayName                  Department
-----------------                                                         -----------                  ----------

###################
# another example if want to export to csv file (excle sheet table)

$Get-AzureADUser | select userprincipalname, displayname, department  | Export-CSV C:\Users\Name\Path\export-nameList.csv -NoTypeInformation -NoClobber

# another example as get -All users
Get-AzureADUser -All $true | Select-Object -Property userprincipalname, displayname, department | Export-CSV C:\Users\Name\Path\export-nameList.csv -NoTypeInformation -NoClobber






