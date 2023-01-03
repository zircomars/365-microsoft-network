#harjoitus  pieni scriptaus, usein  scripttaus editointi tapahtuu powershell ISE:ssä, että siellä testataan sen scriptausta ja  antaa vaihtoehtoisia  kommentoja

# kun varsinainen scriptaus on tehty niin saatettaan  pyörittää sitä varsinaisessa admin powershell tai  ihan tavallinen powershell komentorivi

#toistetaan/suoritettaan jokin scripti olemassa
#vähä kuin  koodaukseski, kun on valmis koodi niin saatettaan ensimmäisenä toistaa mikä koodi kyseessä ja se tiedoston nimi esim. python script.py
PS C:\Users\zhao-\Documents> .\timezone.ps1


Id                         : FLE Standard Time
DisplayName                : (UTC+02:00) Helsinki, Kiev, Riika, Tallinna, Sofia, Vilna
StandardName               : Suomen normaaliaika
DaylightName               : Suomen kesäaika
BaseUtcOffset              : 02:00:00
SupportsDaylightSavingTime : True

# scriptin luomisessa  tapahtuu
# eli avaa joko admin tai tavallisen powershell:in niin syöttää new-item <nimi>.txt esim.  tai joku muu vaikka csv mikä onkaan ja jne
# editointia ei voi tapahtua powershellissä, mutta mikäli jos tiedosto on oikeasti ps1 eli powershell tyyppinen niin avautuu automaatinen powershell ISE scriptaus editori

PS C:\Users\name-\Documents> New-Item teksti.txt


    Directory: C:\Users\name-\Documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----          3.1.2023     20.24              0 teksti.txt