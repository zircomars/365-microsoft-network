<# powershell komennon suoritmainen perus toistettaan, että mitä haetatan esim. tiedostoa, konen sisäisen dataa,
toistetaan scriptausta tai muuta vastaava

eli tuttu echo "moi"  niin linux, powershell ja cmd:ssä toistaa tervehdyksen eli moi
myös koskien kun lukaistaan jokin tietty tiedosto kuten txt, tai scriptaus tai koodipätkät cat file.txt & ja jne. mutta jos tämmöiste csv, word tai muu raportti tiedosto niin tulostuu hirveä erikoismerkkejä, 

josta kukaan ei ymmärrä esim (ò§"Ô!*)È♥?H½æfˆ)£Ž“7
Ì►£gcj¨›)♂Nc`c\pW►Çä²1Nˆ¡qL▲Š☺ó7N♀òwò7‼"BE↑Á>º‰R¢’¨'6◄ÝÄ6b☼1AÌ►‰£$þFJlºg2ÝŸŽ∟:\sØ3»à[ ‡Ç
ÆÄ­òN"ÖÄoRBºPúðÂXgS(ÔÔ9¶p8-ÊÝ>dÊmŸ;°ù@ÃµGZŽ♦÷NWL[♠wÛvk{♀♥Tu°NZäWú☼∟™Þ=Pç÷×
ìž) - vähä kuin salattu tiedosto, ettei voida purkaa sisäistä dataa

C:\Users\Nimi>echo "23"
"23"

C:\Users\Nimi>echo adsf
adsf

PS C:\> $PI = 3.14
PS C:\> Write-Host "The value of `$PI is $PI"
The value of $PI is 3.14

PS C:\WINDOWS\system32> $testi = "missä minun kahvi on?"
PS C:\WINDOWS\system32> Write-Host  $testi
missä minun kahvi on?

# esimerkki cat lukaistaan tiedosto, mutta tämä cat tukee cmd:säskin
PS C:\Users\zhao-\Documents> cat .\GetHardDiskDetails.ps1
$aryComputers = "loopback", "localhost"
Set-Variable -Name intDriveType -Value 3 -Option constant
foreach ($strComputer in $aryComputers)

 {"Hard drives on: " + $strComputer
 Get-WmiObject -Class win32_logicaldisk -ComputerName $strComputer|
 Where {$_.drivetype -eq $intDriveType}}

powershell ympäristössä echo ja write-host ovat sama asia, eli toistettaan jotakin toimintaja, haettavaa dataa tai muuta
jos on määritetty jokin objekti tai tekijä x on jotakin nin myös sitäkin voidaan toistaa
#>

#pieni ero echo ja write-host:lla, sekä write-output toimii kuin echo 
PS C:\WINDOWS\system32> echo this is string
this
is
string

PS C:\WINDOWS\system32> write-host this is a string
this is a string

PS C:\WINDOWS\system32> Write-Output asdfwqer wqerdcxv eqwr fg 234
asdfwqer
wqerdcxv
eqwr
fg
234

PS C:\WINDOWS\system32> $testi = "missä minun kahvi on?"
PS C:\WINDOWS\system32> Write-Host  $testi
missä minun kahvi on?

