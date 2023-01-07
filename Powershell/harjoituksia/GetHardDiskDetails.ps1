$aryComputers = "loopback", "localhost" 
Set-Variable -Name intDriveType -Value 3 -Option constant 
foreach ($strComputer in $aryComputers) 
 
 {"Hard drives on: " + $strComputer 
 Get-WmiObject -Class win32_logicaldisk -ComputerName $strComputer| 
 Where {$_.drivetype -eq $intDriveType}}