# csv (excel sheets version), if got excel sheet all user domains (work account) and department list
# at sheets one of the column e.g. A1 just write "UserPrincipalName,Department"

<#
UserPrincipalName,Department
john.doe@domain.fi, HR
iyiggarsy0.ch, engineer
sxpxrffnmmagullxjkqywbe.cc, staff
jseq43g7ra0dzm0.us, CIO
gtrrnbbxbuijveixcmhw.cfd, IT support
9boh4523a.life, administrator
zldmxgvcyufipanckwv.site, market
4i28l1gdb1uxmwizkykww.space, market
uknefupg.art, IT support
#>

# then run this script, but before need to connect "Msolservice" as admin center

# Import the required module for Office 365
Connect-MsolService

# Import the CSV file
$csv = Import-Csv -Path "C:\Users\NAME\PATH\UserDepartment.csv"

# Loop through each record in the CSV
foreach ($user in $csv) {
    # Update the user's department
    Set-MsolUser -UserPrincipalName $user.UserPrincipalName -Department $user.Department
}
