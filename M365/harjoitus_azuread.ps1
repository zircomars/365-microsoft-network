# powershell ja azure ad kommennot

PS C:\WINDOWS\system32> 

#jos ei ole määrittänyt azure konffausta powershell:iin kantsii sellaista konffata ja tässä käytetätän azure ad (active directory)
PS C:\WINDOWS\system32> install-module -name azuread

#jonka jälkeen kysyy haluatko tehdä luotamuksen arkiston

Untrusted repository
You are installing the modules from an untrusted repository. If you trust this repository, change its
InstallationPolicy value by running the Set-PSRepository cmdlet. Are you sure you want to install the modules from
'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): Y

# siinä menee hetki kun se lataa sen azure ad pakettin ja suorittamisen

