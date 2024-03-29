#powershell , microsoft graph sdk command practices
# this is just practice as check commands and installed modules and packages

# find -module microsoft graph, show version, name, repository and descriptions
$find-module microsoft.graph

#view myscope, as connected to mg graph at that current session find user certifiate, what account logged in. it will show client ID, tenant ID, scopes, authoization type (delegated or application), what account and other information of the data.
$Get-MgContext

ClientId               : ffeab36b-d4e2-482c-bdc1-43cb5daf6094
TenantId               : d19cea72-5b12-4372-aaea-49fdf37b38b0
Scopes                 : {Application.Read.All, Application.ReadWrite.All, AppRoleAssignment.ReadWrite.All,
                         Group.ReadWrite.All…}
AuthType               : Delegated
TokenCredentialType    : InteractiveBrowser
CertificateThumbprint  : 
CertificateSubjectName : 
Account                : Name.admin@DomainName.onmicrosoft.com
AppName                : Microsoft Graph Command Line Tools
ContextScope           : CurrentUser
Certificate            : 
PSHostVersion          : 7.4.1
ManagedIdentityId      : 
ClientSecret           : 
Environment            : Global

# show the collection of the scopes, what a bunch of test, which is as API permissions like a super root. it will prints all the scopes to which user have consented in the current sessions. Scopes are the permissions or privileges that define what actions user (admin) account application can perform on behalf of a user Microsoft graph. 
# same method command `Get-MgContext | Select -ExpandProperty Scopes` 
$(Get-MgContext).Scopes
Application.Read.All
Application.ReadWrite.All
AppRoleAssignment.ReadWrite.All
Group.ReadWrite.All
openid
profile
User.Read
User.Read.All
User.ReadBasic.All
email

##########################################

# if trying get more permissions & added more one scopes, where which try to get use signinactivity/lastsigningdate, so it will added to under the scopes under the list, but before that need to connect as gain more privileges as global admin.
#Use the filter to look for inactive users & login as get the permissions, if without get permissions the command won't run
Connect-MgGraph -Scopes "AuditLog.Read.All" #required for next command

Connect-MgGraph -Scopes "AuditLog.Read.All" #required for next command

PS C:\Users\zhao-\Documents> (Get-MgContext).Scopes                                                                              
Application.Read.All
Application.ReadWrite.All
AppRoleAssignment.ReadWrite.All
Group.ReadWrite.All
openid
profile
User.Read
User.Read.All
User.ReadBasic.All
email
AuditLog.Read.All 
# now, it's added.






