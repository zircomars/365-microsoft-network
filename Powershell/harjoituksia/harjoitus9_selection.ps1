# limit selections and using Try…Catch…Finally: Step-by-step exercises

<# valinta operaattorit, että scripttauksessa kysyttään käyttäjältä tai tekijältä jotakin valintaa, ja siinä tapahtuu jotakin jännää
esim. valitse 1 tai 2 tai 3,  kun käyttäjä valitsee yksi niistä (1-3) niin tapahtuu jotakin

tai halutaan tehdä jotakin toimintaa tai suorittamista
#>

## harjotus1
# avaa powershell ISE & luo jokin tiedosto ja tallenna sopivaan tiedosto paikkaan, koska powershell ise:ssä tulee testaa sitä

 [int]$DefaultChoice = 2
 $choiceRTN = $host.ui.PromptForChoice($caption,$message, $choices,$defaultChoice)

 switch($choiceRTN)
 {
 0 { "choice1" }
 1 { "choice2" }
 2 { "choice3" }
 }

PS C:\WINDOWS\system32> . C:\Users\Name\Documents\PromptForChoiceExercise.ps1
#tämän jälkeen powershell ise:ssä ponnahtaa pieni sovellus ikkuna, että kysyy käyttäjältä valitse kolmesta valikkosta, ja tulostuu choise1 tai 2 tai 3

######################################################
## harjotus2 (try... catch.. finally)

# avaa powershell ISE & luo jokin tiedosto ja tallenna sopivaan tiedosto paikkaan, koska powershell ise:ssä tulee testaa sitä

# toistetaan jotakin parametriä, että try yrittää napatta sen käyttäjän esim. tekstin tai toistamista, ja catch osuudessa kuin yrittää nappaa sen ja toistaa sen, sekä viimeisenä finally - jokin toimii

Param(
 [Parameter(Mandatory=$true)]
 $object)

Try
{
"`tAttempting to create object $object"
New-Object $object }

Catch [system.exception]
{ "`tUnable to create $object" }

Finally
 { "Reached the end of the Script" }

# avaa tavallinen tai perus admin powershell (ei väliä) ja toista scripti
PS C:\WINDOWS\system32> . C:\Users\Name\Documents\TryCatchFinallyExercise.ps1
cmdlet TryCatchFinallyExercise.ps1 at command pipeline position 1
Supply values for the following parameters:
object: adsf
	Attempting to create object adsf
	Unable to create adsf
Reached the end of the Script