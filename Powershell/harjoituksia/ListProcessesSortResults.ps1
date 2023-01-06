

$args = "localhost","loopback","127.0.0.1" 
foreach ($i in $args) 

#tämä tiedosto polku pitäisi  etsiä sitä oikeetta eli oman tietokoneen joku polku riittää
 {$strFile = "C:\Users\Name"+ $i +"Processes.txt" 
 Write-Host "Testing" $i "please wait ..."; 
 Get-WmiObject -computername $i -class win32_process | 
 Select-Object name, processID, Priority, ThreadCount, PageFaults, PageFileUsage | 
 Where-Object {!$_.processID -eq 0} | Sort-Object -property name | 
 Format-Table | Out-File $strFile}

#ouptut: powershell ISE

<#
PS C:\Users\NAME\Documents> C:\Users\NAME\Documents\ListProcessesSortResults.ps1
Testing localhost please wait ...
Testing loopback please wait ...
Testing 127.0.0.1 please wait ...

#>


