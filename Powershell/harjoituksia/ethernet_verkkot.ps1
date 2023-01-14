# tietoliikenne ja verkot

<# verkosta usein tarkistettaan ip-osoitetta tai jopa mac-osoitetta arp taulukkosta.
arp taulukkon vähä kuin hakkeroi verkon lähistön ihmisiä ketkä tai ketä on yhdistynyt kyseisen tukiasemaan (koti tai toimiston modeemiin/laajakaistaan)

usein ip-osoitteen perusteella voi olla mahdollista ketä käyttäjiä, mutta parhaiten saa kiinni käyttäjiä käsiksi mac-osoitteen perusteella
jos tarkistaa oman cmd:stä tai powershell:stä ipconfig /all listasta ja toki perus  ip-osoitteen perusteellakin voi löytää käyttäjän käsiksi
#>

PS C:\WINDOWS\system32> arp -a

Interface: 192.168.1.114 --- 0x8
  Internet Address      Physical Address      Type
  192.168.1.           08:b2:a3:c8:83:5e     dynamic
  192.168.1.X         2c:d9:d1:a7:e2:33      dynamic
  192.168.1.A         7c:8b:c9:f9:a8:6d     static
  220.0.0.22            01-00-5e-00-00-16     static
  220.0.0.251           01-00-5e-00-00-fb     static
  220.0.0.252           01-00-5e-00-00-fc     static

# perus komento tarkistaa oman ip-osoitteen, mutta kun lisää /all mitä tarkoittaa laajennettua sen kyseisen kaikki tarkemmat tiedot ja 
# ominaisuudet eli mm. langaton ja fyysinen lähiverkon yhteys vaikka oiski usb ethernet adapteri tai perus verkkokaapeli johto ja jne
# myös jopa kyseisen käyttäjän tietokonen hostname 
PS C:\WINDOWS\system32> ipconfig

Windows IP Configuration

# source eli lähde ip-osoitteesta vähä kuin testataan google pinggausta porttiin 80
PS C:\WINDOWS\system32> tnc google.fi -port 80

ComputerName     : google.fi
RemoteAddress    : 205.99.698.3
RemotePort       : 80
InterfaceAlias   : Ethernet 2
SourceAddress    : 10.11.12.114
TcpTestSucceeded : True

#