#notWorking
#ToBeTinkeredWith

#There are two columns in csv DisplayName and UPN. Can anyone please help me with this

Import-Csv -Path "C:\Users\Awais\OneDrive - CS\Desktop\GraphAPI.csv" | foreach {
$apiUrl = "https://graph.microsoft.com/v1.0/me/events"
$bodyy = @"
{
"subject": "Let's go for lunch",
"body": {
"contentType": "HTML",
"content": "Does noon work for you?"
},
"start": {
"dateTime": $($_.StartTime),
"timeZone": "Pakistan Standard Time"
},
"end": {
"dateTime": $($_.EndTime),
"timeZone": "Pakistan Standard Time"
},
"location":{
"displayName":$($_.DisplayName)
},
"attendees": [
{
"emailAddress": {
"address":$($_.UPN),                                            #Want to use csv data here
"name": "Awais Khalid"
 },
"type": "required"
 }
 ],
 "allowNewTimeProposals": true,
 "isOnlineMeeting": true,
 "onlineMeetingProvider": "teamsForBusiness"
 }
"@

$DataPOST = Invoke-RestMethod -Headers @{Authorization = "Bearer $($Tokenresponse.access_token)"} -Uri $apiUrl -Method POST -Body $bodyy -ContentType 'application/json'}
}
