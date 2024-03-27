$params = @{
    DisplayName         = "TestMGgTeam"
    Description         = "Test MSGraph teams"
    MailEnabled         = "False"
    MailNickname        = "TestMailMGName"
    SecurityEnabled     = "true"
    Visibility          = "Private"
}

New-MgGroup -BodyParameters $params


<# at powershell view & run this scripts
PS C:\Users\ZT> $params = @{     
>>     DisplayName         = "TestMGgTeam"
>>     Description         = "Test MSGraph teams"
>>     MailEnabled         = "False"
>>     MailNickname        = "TestMailMGName"
>>     SecurityEnabled     = "true"
>>     Visibility          = "Private"
>> }
PS C:\Users\ZT> New-MgGroup -BodyParameter $params

DisplayName Id                                   MailNickname   Description        GroupTypes
----------- --                                   ------------   -----------        ----------
TestMGgTeam sdfgdfsa-4351-4f8e-1234-34d0f20f31ae TestMailMGName Test MSGraph teams {}

PS C:\Users\ZT> Get-MgGroup      

DisplayName   Id                                   MailNickname   Description                                GroupTypes
-----------   --                                   ------------   -----------                                ----------
o365-group-2  axcvva12-9ad3-47bf-55ad-bd7787bf7615 bravo          toinen koko tiimi                          {Unified}
team-2        c7c6e8b6-9416-4fd4-8bda-acb2992a74d7 5e5bac0d-1     I ordered a new laptop case yesterday.     {}
o365-group-1  xzcvxczv-10fb-48ec-b58f-asdfasdfasde alpha          koko tiimi                                 {Unified}
team-1        eqrgergrr-e3ae-49f8-9f76-eab9561089cf 5d91c42a-0    Watch out, there's quicksand!              {}
Myynti osasto asdfasdf-b8e0-4120-aa7a-9ccc7ed5a175 Myyntigr1                                                 {}
team-3        dd389ca4-fad3-49cf-b91a-dbd020115fdf 67436ff8-f     Turning the page is important to progress. {}
TestMGgTeam   qwertyxv-81e5-4101-90c2-44f6737644c9 TestMailMGName Test MSGraph teams                         {}


#>
