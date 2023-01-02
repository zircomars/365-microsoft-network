# modules harjoitus
#tähti * tarkoittaa jokerimerkkiä ja englanniksi: wildcard character


#kommennolla ei ole kauheasti eroa, mutta tulostuksena viimeiset numerot on enemmän/vähemmän, että tietty määrä toimintaa halutaan nähdä
PS C:\WINDOWS\system32> Gcm *address* Find-Command -Respositary PSGallery | Select-Object -First 5
PS C:\WINDOWS\system32> Gcm *address* Find-Command -Respositary PSGallery | Select-Object -First 10


output:
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Add-NetNatExternalAddress                          1.0.0.0    NetNat
Function        Get-CsOnlineLisCivicAddress                        4.9.1      MicrosoftTeams
Function        Get-CsTenantTrustedIPAddress                       4.9.1      MicrosoftTeams
Function        Get-DnsClientServerAddress                         1.0.0.0    DnsClient
Function        Get-NetFirewallAddressFilter                       2.0.0.0    NetSecurity

