# dot source 

<# Jokainen komentosarja toimii omassa laajuudessaan. Komentosarjassa luodut funktiot, muuttujat, aliakset ja asemat ovat olemassa vain komentosarjan laajuudessa. 
Et voi käyttää näitä kohteita tai niiden arvoja alueella, jossa komentosarja suoritetaan. 
#>

<# dot source vähä kuin suom. piste lähdetoiminta . C:\Polku\tiedosto.ps1 & että suorittaa scriptauksen powershell kommennossa, 
että scriptauksen luoma voi olla funktiot, muuttujat, alias tai jokin asema luoma siinä laajudessa tai ympäristössä. 
Kun komentosarja on suoritettu nii voi hyödyntää kohteita ja käyttää niitä arvoja istunnossa.

esim. 1)
PS C:\WINDOWS\system32> . C:\Users\name\Documents\TryCatchFinallyExercise.ps1

cmdlet TryCatchFinallyExercise.ps1 at command pipeline position 1
Supply values for the following parameters:
object: ewqr
        Attempting to create object ewqr
        Unable to create ewqr
Reached the end of the Script
PS C:\WINDOWS\system32>

esim2)
PS C:\> . C:\scripts\ConversionFunctions.ps1
PS C:\> convertToMiles 6
6 kilometers equals 3.7266 miles

#>












