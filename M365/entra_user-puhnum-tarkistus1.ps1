# Varmista, että Graph-yhteys on avoinna ja kirjauttuminen Entra ID (microsoft ympäristöön) ja varmista on oikeudet varmuuden vuoksi, koska tämä pätee hakemalla käyttäjän tietoja 
Connect-MgGraph -Scopes "User.Read.All", "UserAuthenticationMethod.Read.All"
Select-MgProfile -Name "beta"

# Hae kaikki käyttäjät
$users = Get-MgUser -All

# Aloita tulosten kerääminen
$results = @()

foreach ($user in $users) {
    try {
        $phoneMethod = Get-MgUserAuthenticationPhoneMethod -UserId $user.Id
        if ($phoneMethod.PhoneNumber) {
            $results += [PSCustomObject]@{
                User               = $user.DisplayName
                UserPrincipalName = $user.UserPrincipalName
                PhoneNumber        = $phoneMethod.PhoneNumber
                Method             = "✅ Rekisteröity puhelin"
            }
        } else {
            $results += [PSCustomObject]@{
                User               = $user.DisplayName
                UserPrincipalName = $user.UserPrincipalName
                PhoneNumber        = "Ei puhelinta"
                Method             = "❌ Ei rekisteröity puhelin"
            }
        }
    } catch {
        $results += [PSCustomObject]@{
            User               = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            PhoneNumber        = "Virhe"
            Method             = "⚠️ Ei voitu hakea"
        }
    }
}

# Näytä tulokset PowerShellissä
$results | Format-Table -AutoSize

# (Valinnainen) Vie CSV-tiedostoksi
$results | Export-Csv -Path "C:\MFA_PhoneReport.csv" -NoTypeInformation -Encoding UTF8


@'
Tulostus view example:

User              UserPrincipalName                                                                   PhoneNumber    Method
----              -----------------                                                                   -----------    ------
Admin Company     admin@domain.onmicrosoft.com                                                        Ei puhelinta   ❌ Ei rekisteröity puhelin
....

tech pad          local@domain.onmicrosoft.com                                                        240555123      ✅ Rekisteröity puhelin
Ted Duncan        Ted@domain.onmicrosoft.com                                                          Ei puhelinta   ❌ Ei rekisteröity puhelin
Terry admin       Terry.admin_bitwarelockoutlook.onmicrosoft.com#EXT#@domain.onmicrosoft.com          Ei puhelinta   ❌ Ei rekisteröity puhelin
William admin     William.admin@domain.onmicrosoft.com                                                240555123      ✅ Rekisteröity puhelin


'@
