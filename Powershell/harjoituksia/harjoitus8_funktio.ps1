# debuggointi funktio harjoitus

#powershell ise luo  funtio ja tallenna tiedostokseen my_function.ps1 (nimi tiedosto saa keksiä ja tallenne järkevään tiedosto polkuun)

Function my-function
{
 Param(
 [int]$a,
 [int]$b)
 "$a plus $b equals $($a+$b)"
}

# avaa powershell admin ja tässä osassa suoriutuu se funktio osuus eli periaatteessa voi skipata rivi 15 & suoraan toistaa $my-function

PS C:\WINDOWS\system32> C:\Users\name\Documents\my-function.ps1

PS C:\WINDOWS\system32> my-function
0 plus 0 equals four

PS C:\WINDOWS\system32> my-function
0 plus 0 equals four

#tässä jälkeen kuin kirjauduttaan tai mennään funktio tiedoston toiminnan sisään ja toistettaan noita a ja b:tä
Hit Line breakpoint on 'C:\Users\name\Documents\my-function.ps1:7'
[DBG]: PS C:\WINDOWS\system32>> 

[DBG]: PS C:\WINDOWS\system32>> $a
0

[DBG]: PS C:\WINDOWS\system32>> $b
0

#tässä yritetty saada kirjaimia  numeroiksi, että pientä matikkaa, mutta vähä epäonnistunut
[DBG]: PS C:\WINDOWS\system32>> $a = $b = 2

[DBG]: PS C:\WINDOWS\system32>> 
PS C:\WINDOWS\system32> 
PS C:\WINDOWS\system32> my-function
0 plus 0 equals four

# mutta toki voidaan toistaa sitä a ja b:tä, että mikä numero niille on asennettu tässä istunnon aikana
[DBG]: PS C:\WINDOWS\system32>> $a = $b = 2

[DBG]: PS C:\WINDOWS\system32>> $a
2

[DBG]: PS C:\WINDOWS\system32>> $b
2

# debuggointi osuus
# avaa admin powershell
<# Käytä Set-PSBreakPoint-cmdlet-komentoa asettaaksesi keskeytyskohdan my-function -funktiolle
#script my-function.ps1. Muista, että sinun on käytettävä komentosarjan koko polkua milloin
#teet tämän. #>

PS C:\WINDOWS\system32> Set-PSBreakpoint -Script C:\Users\name\Documents\my-function.ps1 -Command my-function

  ID Script                      Line Command                     Variable                   Action
  -- ------                      ---- -------                     --------                   ------
   0 my-function.ps1                  my-function


# toistetaan se scriptaus funktio kertaalleen
PS C:\WINDOWS\system32> my-function
0 plus 0 equals four
PS C:\WINDOWS\system32> Get-PSBreakpoint

  ID Script                      Line Command                     Variable                   Action
  -- ------                      ---- -------                     --------                   ------
   0 my-function.ps1                  my-function

# ID script numero muuttuu 
PS C:\WINDOWS\system32> Remove-PSBreakpoint -Id  0
PS C:\WINDOWS\system32> Set-PSBreakpoint -Command my-function

  ID Script                      Line Command                     Variable                   Action
  -- ------                      ---- -------                     --------                   ------
   1                                  my-function

#toistetaan sitä my_function.ps1 scriptiä ja ollaan sisällä (im in)
PS C:\WINDOWS\system32> my-function
Entering debug mode. Use h or ? for help.

Hit Command breakpoint on 'my-function'

At C:\Users\name\Documents\my-function.ps1:2 char:1
+ {
+ ~
[DBG]: PS C:\WINDOWS\system32>> $a
0
[DBG]: PS C:\WINDOWS\system32>> $b
0
[DBG]: PS C:\WINDOWS\system32>> exit
0 plus 0 equals four
PS C:\WINDOWS\system32>

#harjoitus kirjann mukaan siinä tulee dot-source sitä script tiedostoa eli my-function1.ps1 (tämä ei toiminut / en osanut)

#suoritettaan uudestaan, että määritettään a ja b:lle jokin arvo, että pieni laskenta
PS C:\WINDOWS\system32> my-function -a 12 -b 14
Hit Command breakpoint on 'my-function'

At C:\Users\name\Documents\my-function.ps1:2 char:1
+ {
+ ~
[DBG]: PS C:\WINDOWS\system32>> $a
12
[DBG]: PS C:\WINDOWS\system32>> $b
14
[DBG]: PS C:\WINDOWS\system32>> $b =+
>> ^C
[DBG]: PS C:\WINDOWS\system32>> $b = 0
[DBG]: PS C:\WINDOWS\system32>> $b
0
[DBG]: PS C:\WINDOWS\system32>> exit
12 plus 0 equals four

<# viimeisenä poistettaan se funktion sisään pääsy, koska rivillä 55-70 siinä määritettiin se id script ja jos käyttää
powershell ISE niin siellä voi käyttää jatkuvasti sitä editointia, koska powershell admin siinä istunnossa pitää määrittää se 
psbreakpoint ja sen id scriptaus salliminen ja jotta voidaan mennän debuggoimaan sen script sisään #>

#tässä on käytetty pipeline (putki) | asdf & myös toistettaan, että saadaanko se get-psbreakpoint id numero vielä
PS C:\WINDOWS\system32> Get-PSBreakpoint | Remove-PSBreakpoint
PS C:\WINDOWS\system32> Get-PSBreakpoint
PS C:\WINDOWS\system32>
PS C:\WINDOWS\system32> my-function -a 12 -b 14
12 plus 14 equals four
