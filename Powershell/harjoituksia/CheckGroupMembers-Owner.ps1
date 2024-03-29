# this is microsoft graph one of the script, before run this script, need to be "connect-mggraph" first then can run 

# View group members
$group = Get-MgGroup | Where-Object {$_.DisplayName -eq "o365-group-1"}
# or, same as upper one, but same method anyway 
$group = Get-MgGroup -Filter "displayName eq 'o365-group-1'"

PS C:\Users\ZT> $group = Get-MgGroup | Where-Object {$_.DisplayName -eq "o365-group-1"}
PS C:\Users\ZT> Get-MgGroupMember -GroupId $group.Id | ForEach-Object { @{ UserId=$_.Id}} | get-MgUser | Select-Object id, DisplayName, Mail

Id                                   DisplayName       Mail
--                                   -----------       ----
edf6fb3c4c90                         Anna Kim
33aa6b818bb9                         Constance Wheeler
14472360b969                         Danny Cox
197895d51bfd                         Everett Ray
c33c9188a283                         Garry Moore       xzcvdfs@gmail.com
0deb04854419                         jack admin
cd9a168c0d98                         Mark Cavill       asdghjasdg@gmail.com
9865e3b6e0f0                         Melvin Mendez
e264a67dbc78                         Michael Johnson   asdf@gmail.com
0ef79faed1ff                         Michelle Evans    bus_unelayo19@aol.com
b13ef1b94383                         Olivia Hodges
..

#that's weird? If check mggroupmember, which will show all member names, maybe display 3-4 same names..
# if check owners, then just displaynames will be once

PS C:\Users\ZT> Get-MgGroupOwner -GroupId $group.Id | ForEach-Object { @{ UserId=$_.Id}} | get-MgUser | Select-Object id, DisplayName, Mail 

Id                                   DisplayName       Mail
--                                   -----------       ----
edf6fb3c4c90                         Anna Kim
33aa6b818bb9                         Constance Wheeler
14472360b969                         Danny Cox
197895d51bfd                         Everett Ray
c33c9188a283                         Garry Moore       xzcvdfs@gmail.com
0deb04854419                         jack admin
cd9a168c0d98                         Mark Cavill       asdghjasdg@gmail.com
9865e3b6e0f0                         Melvin Mendez
e264a67dbc78                         Michael Johnson   asdf@gmail.com
0ef79faed1ff                         Michelle Evans    bus_unelayo19@aol.com
b13ef1b94383                         Olivia Hodges
f9589f5bcf1c                         Ted Duncan
