<# powershell komennon suoritmainen perus toistettaan, että mitä haetatan esim. tiedostoa, konen sisäisen dataa,
toistetaan scriptausta tai muuta vastaava

eli tuttu echo "moi"  niin linux, powershell ja cmd:ssä toistaa tervehdyksen eli moi
myös koskien kun lukaistaan jokin txt iedosto cat file.txt & ja jne.

C:\Users\Nimi>echo "23"
"23"

C:\Users\Nimi>echo adsf
adsf

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



