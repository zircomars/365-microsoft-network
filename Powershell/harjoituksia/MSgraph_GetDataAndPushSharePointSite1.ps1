<# msgraph-getDataAndPushSharepoint
# using vscode + ms graph and run this script get azure user data information and properties, then it will export to csv sheets and exported csv sheets it will send it to sharepoint path (URL) down the Sharing Documents
# BEFORE RUN THE SCRIPT; if using ms graph on vscode/powershell ISE scripting app
# login first; connect-MgGraph -Scopes "User.Read.All","Group.ReadWrite.All"

# this script is for running to test SharePoint own environment, before send it to real "product" and (THIS IS TEST ENVIRONMENT)

#>

####################
# login ms graph and getting admin center user data like start name "Mike*", like mysql name start by Mike (START HERE)

# user account properties as Azure entra id / admin center user profile
$Properties = @(
    'UserPrincipalName', 'DisplayName' , 'CompanyName', 'SignInActivity', 'CreatedDateTime', 'BusinessPhones', 'MobilePhone', 'OtherMails'
)

# Get all users along with the properties
$AllUsers = Get-MgUser -All -Property $Properties

# Perform Search, getting azure cloud user data like start name "M*" --> Mike, Michael, Mindy, Matt, Millie &....
$FilteredUsers = $AllUsers | Where-Object { $_.UserPrincipalName -like "ext-*" }

# Add LastLoginDate property
$FilteredUsers | ForEach-Object {
    $LastLoginDate = $_.SignInActivity.LastSignInDateTime         
    $_ | Add-Member -MemberType NoteProperty -Name LastLoginDate -Value $LastLoginDate
}

#####################################################

# get the azure group id (object id) if user are in the group as permissions
# Get the group members & this is same as azure(s) portal id (object id) & the function will check as "FilteredUsers" if got this access will say "access" or other wise do not have have normal "denied"
$GroupMembers = Get-MgGroupMember -GroupId "<group_id-FromAzureEntra"

# Add AccessGroup (VPN access) property
$FilteredUsers | ForEach-Object {
    if ($GroupMembers.Id -contains $_.Id) {
        $_ | Add-Member -MemberType NoteProperty -Name AccessGroup -Value "Access"
    } else {
        $_ | Add-Member -MemberType NoteProperty -Name AccessGroup -Value "Denied"
    }
}


# Export datat out to computer File Export path locationand new csv sheets, if exist csv file name it can't be replace.
# If create new excel sheets file remove former one first then run this script again. 
# Export UserPrincipalName, CompanyName and LastLoginDate properties to a CSV file
$ExportCsvPath = "C:\Users\ZT\Path\file.csv" 
#$FilteredUsers | Select-Object UserPrincipalName,CompanyName,LastLoginDate | Export-Csv -Path $csvPath -NoTypeInformation

#$ExportCsvPath2 = "C:\Users\ZhaoTan\Downloads\file2.csv"

# this function, is make exported excel sheets more readable, like column A1, B1, C1 got those items and values will show up, but first looks it is shrinked, but it is availbe edit and see more details
# e.g. first open (phone number; ###### & lastLogin & createdDate; ######), and export line which one is first also properties (reading left to right) & allow ÅÄÖ characters (encoding utf8)
$FilteredUsers | Select-Object UserPrincipalName, DisplayName, CompanyName, LastLoginDate, CreatedDateTime, 
    @{Name='BusinessPhones';Expression={($_.BusinessPhones -join ";")}}, 
    @{Name='OtherMails';Expression={($_.OtherMails -join ";")}}, 
    @{Name='MobilePhone';Expression={($_.MobilePhone -join ";")}},
    @{Name='VPN Access';Expression={$_.AccessGroup -join ";" }} | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-File -FilePath $ExportCsvPath -Encoding utf8BOM

# this is same as up one, just browser version is more readable if some got basic license available, also the problem is the column A1 got all those datas
<#
$FilteredUsers | Select-Object UserPrincipalName, DisplayName, CompanyName, LastLoginDate, CreatedDateTime, 
    @{Name='BusinessPhones';Expression={($_.BusinessPhones -join ";")}}, 
    @{Name='OtherMails';Expression={($_.OtherMails -join ";")}}, 
    @{Name='VPN Access';Expression={$_.AccessGroup -join ";" }} | Export-Csv -Path $ExportCsvPath2  -NoTypeInformation -Delimiter "," -Encoding UTF8
#>
######################################################
# Upload the CSV file to SharePoint (START HERE) - SCRIPT METHOD 1 (FAILED)
# On this function/parameters need to connect within MS graph to Sharepoint sites
# NOT COMPLETED STILL MISSING SOMETHING, IF RUN THIS SCRIPT STILL NOT WORK (Z)

#$siteUrl = "https://codemenfi.sharepoint.com/sites/Z-Datoja/Shared%20Documents/Forms/AllItems.aspx"
#$library = "Documents"
#$credentials = Get-Credential
#Connect-PnPOnline -Url $siteUrl -Credentials $credentials
#Add-PnPFile -Path $csvPath -Folder $library


######################################################
# Upload the CSV file to Sharepoint (START HERE) - SCRIPT METHOD 2 (SUCCESS) (THIS IS TEST VERSION) (SHAREPOINT Z-DATOJA)

# Config Variables, just sharepoint name (https://organizationDomainName.sharepoint/site/...)
# all site can find out at admin center check all sharepoint site names, e.g. https://<companyName>.sharepoint.com/sites/<siteName>
# Share document , means that site path "/Documents" will upload and add the exported or exist file to there, and it will be replace every time when run this script (last time uploaded & upgrade 24.12.2023 13:14:00, and now new version is; 4.1.2024 9:00)

$SiteURL = "https://<domain>.sharepoint.com/sites/"
$DestinationPath = "Shared Documents" #Site Relative Path of the Library, but every SharePoint got own "Share Documents", is like super root, where path where share it to teams/managers/HR and ect, and given specific folder name (e.g. Shared Documents / marketing/materials/...)


# Upload file path C:\Users\<name>\<path>\<filename.txt>
# example upload the like .txt any of the file type even pdf, word and ect.
$SourceFilePath = "C:\Users\ZT\Path\file.csv" 
  
# Connect to PnP Online
# it will popup login method, and ask which one account it will be loggin, if is first time it ask permission request to use this pnp and ms graph automation/integraion and all request types
Connect-PnPOnline -Url $SiteURL -interactive
      
#powershell pnp to upload file to sharepoint online location and url path 
Add-PnPFile -Path $SourceFilePath -Folder $DestinationPath

# display at terminal (like summary view)
$FilteredUsers | Format-Table -AutoSize UserPrincipalName, DisplayName, CompanyName, LastLoginDate, CreatedDateTime, BusinessPhones, MobilePhone, OtherMails, AccessGroup

