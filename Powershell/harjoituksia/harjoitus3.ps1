

# measuring object
Get-ChildItem -File | Measure -Property Length -Sum -Average -Minimum -Max 

output:
Count    : 4303
Average  : 454348,673483616
Sum      : 1955062342
Maximum  : 148633544
Minimum  : 0
Property : Length

# selecting object
Get-Process | Sort-Object -Property VM | Select-Object -last 10 | FL name, VM

output:
Name : msedge
VM   : 2308226330624

Name : msedge
VM   : 2341923758080


Get-EventLog Security -newest 10 | Select-Object -property EventID, TimeWritten, Message

output something:
EventID TimeWritten       Message
------- -----------       -------

