# powershell script send email to user by go Microsoft azure app registration "Microsoft Graph"
# set app registartion (clientID, cert/sec value, tenant ID)
$clientID = "<clientID>"
$Clientsecret = "<sertficiateSecretID>"
$tenantID = "<tenantID>"

# sender mail , it has to be real one or maybe owner
$MailSender = "admin@domain.com"

#Connect to GRAPH API
$tokenBody = @{
    Grant_Type    = "client_credentials"
    Scope         = "https://graph.microsoft.com/.default"
    Client_Id     = $clientId
    Client_Secret = $clientSecret
}
$tokenResponse = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenantID/oauth2/v2.0/token" -Method POST -Body $tokenBody
$headers = @{
    "Authorization" = "Bearer $($tokenResponse.access_token)"
    "Content-type"  = "application/json"
}

#Send Mail, torecipient (To the recipient)
$URLsend = "https://graph.microsoft.com/v1.0/users/$MailSender/sendMail"
$BodyJsonsend = @"
                    {
                        "message": {
                          "subject": "Hello World from Microsoft Graph API",
                          "body": {
                            "contentType": "HTML",
                            "content": "This Mail is sent via Microsoft <br>
                            GRAPH <br>
                            API<br>
                            
                            "
                          },
                          "toRecipients": [
                            {
                              "emailAddress": {
                                "address": "user1@domain.com"
                              }
                            }
                          ]
                        },
                        "saveToSentItems": "false"
                      }
"@

# at end make allow äö or special characters, who will receive the email looks error 
Invoke-RestMethod -Method POST -Uri $URLsend -Headers $headers -Body $BodyJsonsend -ContentType "application/json; charset=utf-8"
