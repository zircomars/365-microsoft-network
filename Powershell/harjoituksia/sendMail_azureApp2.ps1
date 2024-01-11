#tokenBody the an app registration app client id, certi/secret 
$tokenBody = @{
   Grant_Type    = "client_credentials"
   Scope         = "https://graph.microsoft.com/.default"
   Client_Id     = "<clientID-value>"
   Client_Secret = "<certficate_secret>"
}
$tokenResponse = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenantID/oauth2/v2.0/token" -Method POST -Body $tokenBody
$headers = @{
   "Authorization" = "Bearer $($tokenResponse.access_token)"
   "Content-type" = "application/json"
}

# mailFrom must be the app registration owner, if it's fake email it wont work
$MailFrom = "<senderEmail>"
$MailTo = "<receiptEmail>"
$URLsend = "https://graph.microsoft.com/v1.0/users/$MailFrom/sendMail"
$BodyJsonsend = @"
{
   "message": {
   "subject": "Powershell Test email",
   "body": {
      "contentType": "HTML",
      "content": "This fun <br>"
   },
   "toRecipients": [
      {
      "emailAddress": {
      "address": "$mailto"
          }
      }
   ]
   },
   "saveToSentItems": "true"
}
"@
Invoke-RestMethod -Method POST -Uri $URLsend -Headers $headers -Body $BodyJsonsend
