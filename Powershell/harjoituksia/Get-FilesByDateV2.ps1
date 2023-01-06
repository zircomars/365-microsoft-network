Function Get-FilesByDate
{
  Param
 (
  [string[]]$fileTypes = @(".doc","*.docx"),
  [Parameter(Mandatory=$true)]
  [int]$month,
  [Parameter(Mandatory=$true)]
  [int]$year,
  [Parameter(Mandatory=$true)]
  [string[]]$path
  )
 Get-ChildItem -Path $path -Include $filetypes -Recurse | Where-Object { 
 $_.lastwritetime.month -eq $month -AND $_.lastwritetime.year -eq $year }
}