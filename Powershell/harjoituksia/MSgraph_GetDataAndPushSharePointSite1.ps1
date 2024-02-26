
# msgraph-getDataAndPushSharepoint

# login ms graph and getting admin center user data like start name "Mike*", like mysql name start by Mike (START HERE)

$Properties = @(
    'UserPrincipalName', 'CompanyName', 'SignInActivity'  
)

# Get all users along with the properties
$AllUsers = Get-MgUser -All -Property $Properties

# Perform Search
$FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "Mike*" }

# Add LastLoginDate property
$FilteredUsers | ForEach-Object {
    $LastLoginDate = $_.SignInActivity.LastSignInDateTime         
    $_ | Add-Member -MemberType NoteProperty -Name LastLoginDate -Value $LastLoginDate
}

# Export datat out to computer File Export path locationand new csv sheets, if exist csv file name it can't be replace.
# If create new excel sheets file remove former one first then run this script again. 
# Export UserPrincipalName, CompanyName and LastLoginDate properties to a CSV file
$csvPath = "C:\Users\<Name>\<path>\<fileName>"
$FilteredUsers | Select-Object UserPrincipalName,CompanyName,LastLoginDate | Export-Csv -Path $csvPath -NoTypeInformation

######
# Upload the CSV file to Sharepoint (START HERE)

# Config Variables, just sharepoint name (https://organizationDomainName.sharepoint/site/...)
# all site can find out at admin center check all sharepoint site names, e.g. https://<companyName>.sharepoint.com/sites/<siteName>
# Share document , means that site path "/Documents" will upload and add the exported or exist file to there, and it will be replace every time when run this script (last time uploaded & upgrade 24.12.2023 13:14:00, and now new version is; 4.1.2024 9:00)
$SiteURL = "https://<domainName>.sharepoint.com/sites/<SiteName>"
$DestinationPath = "Shared Documents" #Site Relative Path of the Library
 
# Upload file path C:\Users\<name>\<path>\<filename.txt>
# example upload the like .txt any of the file type even pdf, word and ect.
$SourceFilePath ="C:\Users\<userName>\<path>\<Filename>" 
  
# Connect to PnP Online
# it will popup login method, and ask which one, account got this permission, but it is good one use admin account, or if using work account, it need to be check does it got this permissions anyway?
Connect-PnPOnline -Url $SiteURL -interactive
      
#powershell pnp to upload file to sharepoint online
Add-PnPFile -Path $SourceFilePath -Folder $DestinationPath

#### example at terminal success and uplodaded file
$PS C:\Users\ZT\Filename.csv .\MSgraph_GetDataAndPushSharePointSite1.ps1

Name           Type Items/Size Last Modified
----           ---- ---------- -------------
Filename.csv   File        167 26/02/2024 12.51.14

