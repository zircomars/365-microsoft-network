# kirjaudu microsoft entra id ympäristöön
$Connect-MgGraph

# Hae kaikki käyttäjät organisaatiosta
$users = Get-MgUser -All

# Käy läpi jokainen käyttäjä
foreach ($user in $users) {
    # Hae käyttäjän puhelinnumeron todennusmenetelmä
    $phoneMethod = Get-MgUserAuthenticationPhoneMethod -UserId $user.UserPrincipalName

    # Tarkista onko puhelinnumero olemassa
    if ($phoneMethod.PhoneNumber) {
        # Jos puhelinnumero löytyy, tulostetaan se
        Write-Output "$($user.UserPrincipalName) => 📱 Puhelinnumero rekisteröity: $($phoneMethod.PhoneNumber)"
    } else {
        # Jos puhelinnumero puuttuu, ilmoitetaan siitä
        Write-Output "$($user.UserPrincipalName) => ❌ Ei puhelinnumeroa"
    }
}


# tämä on komennentti ja miltä se tulostus näyttää mallina:
@'
jesse@contoso.com => 📱 Puhelinnumero rekisteröity: +358501112233
emma@contoso.com => ❌ Ei puhelinnumeroa
timo@contoso.com => 📱 Puhelinnumero rekisteröity: +358401234567
mari@contoso.com => ❌ Ei puhelinnumeroa
pekka@contoso.com => 📱 Puhelinnumero rekisteröity: +358449876543
sanna@contoso.com => ❌ Ei puhelinnumeroa
jani@contoso.com => 📱 Puhelinnumero rekisteröity: +358503456789
minna@contoso.com => ❌ Ei puhelinnumeroa
ville@contoso.com => 📱 Puhelinnumero rekisteröity: +358407654321
rita@contoso.com => ❌ Ei puhelinnumeroa
'@
