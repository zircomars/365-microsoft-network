foreach ($i in $args) 
 {Get-ChildItem $i | Where-Object length -gt 1000 | 
 Sort-Object -property name}