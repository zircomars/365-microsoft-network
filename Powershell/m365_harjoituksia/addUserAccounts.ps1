# create a new user
az ad user create

# create a new user
New-MgUser


$invitations = import-csv c:\bulkinvite\invitations.csv

$messageInfo = [Microsoft.Graph.PowerShell.Models.MicrosoftGraphInvitation]@{ `
   CustomizedMessageBody = "Hello. You are invited to the Contoso organization." }

foreach ($email in $invitations)
   {New-MgInvitation `
      -InviteRedirectUrl https://myapps.microsoft.com ` 
      -InvitedUserDisplayName $email.Name `
      -InvitedUserEmailAddress $email.InvitedUserEmailAddress `
      -InvitedUserMessageInfo $messageInfo `
      -SendInvitationMessage 
   }

############################################

# remove user accounts
# $Remove-MgUser
