# one of example get user properties and all information (as information)
# some examples

PS C:\Users\zhao-> Get-AzureADUser -ObjectId "Michael@domain.onmicrosoft.com" | select *


ExtensionProperty              : {[odata.metadata, https://graph.windows.net/xcvbcvb-qe-4f18-1234-
                                 asdgsadg/$metadata#directoryObjects/@Element], [odata.type,
                                 Microsoft.DirectoryServices.User], [createdDateTime, 2/24/2024
                                 3:49:32 PM], [employeeId, ]...}
DeletionTimestamp              :
ObjectId                       : b2be0622-36f6-46cf-9a26-8e3fe0ad2ca7
ObjectType                     : User
AccountEnabled                 : True
AgeGroup                       :
AssignedLicenses               : {}
AssignedPlans                  : {}
City                           :
CompanyName                    : flyykyqohe
ConsentProvidedForMinor        :
Country                        :
CreationType                   :
Department                     : sajpuemamm
DirSyncEnabled                 :
DisplayName                    : Michael Johnson
FacsimileTelephoneNumber       :
GivenName                      : Michael
IsCompromised                  :
ImmutableId                    :
JobTitle                       :
LastDirSyncTime                :
LegalAgeGroupClassification    :
Mail                           : asdf@gmail.com
MailNickName                   : Michael
Mobile                         : +16158984936
OnPremisesSecurityIdentifier   :
OtherMails                     : {leferi4610@bizatop.com}
PasswordPolicies               :
PasswordProfile                :
PhysicalDeliveryOfficeName     :
PostalCode                     :
PreferredLanguage              :
ProvisionedPlans               : {}
ProvisioningErrors             : {}
ProxyAddresses                 : {smtp:Michael@domain.onmicrosoft.com, SMTP:asdf@gmail.com}
RefreshTokensValidFromDateTime : 2/24/2024 3:51:45 PM
ShowInAddressList              :
SignInNames                    : {}
SipProxyAddress                :
State                          :
StreetAddress                  :
Surname                        : Johnson
TelephoneNumber                : +13644772015
UsageLocation                  :
UserPrincipalName              : Michael@domain.onmicrosoft.com
UserState                      :
UserStateChangedOn             :
UserType                       : Member

##########################

# get whole organization all domain user and their principal names and are they member or visitor (like external users and ect)

PS C:\Users\zhao-> Get-AzureADUser -all $true

ObjectId                             DisplayName     UserPrincipalName                           UserType
--------                             -----------     -----------------                           --------
9b64da64-a729-4420-9ed5-578e54e3df4f jack admin      jack.admin@domain.onmicrosoft.com           Member
e26377a8-7b3d-4659-8d3e-dd97a38931d5 Michael Johnson Michael@domain.onmicrosoft.com              Member
212e0de6-e8dc-4480-9402-4b128a2c394e Michelle Evans  Michelle@domain.onmicrosoft.com             Member
440b0fa2-47ab-4023-9f1f-9965918288af tech pad        local@domain.onmicrosoft.com                Member
1d89da99-243c-4f22-bba9-e0b019e5c2a4 local admin     local.admin@domain.onmicrosoft.com           Member
















