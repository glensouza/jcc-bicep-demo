$pair = "${env:username}:${env:personalaccesstoken}"
$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
$base64 = [System.Convert]::ToBase64String($bytes)
$basicAuthValue = "Basic $base64"

Write-Host username: ${env:username}
Write-Host personalaccesstoken: ${env:personalaccesstoken}
Write-Host basicAuthValue: $basicAuthValue

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
#$headers.Add("Authorization", $basicAuthValue)
$headers.Add("Authorization", "Basic Z2xlbnN0ZXI3NUBob3RtYWlsLmNvbToydzZ1bnN4eW4zMnppaDJwaDR1NWp4dWdsdHZpbjVtZG96cDJvYWZhNWRkdjI2YW5xZ2tx")
$headers.Add("Cookie", "VstsSession=%7B%22PersistentSessionId%22%3A%2296afd73e-2109-407b-8119-42e9b5887e48%22%2C%22PendingAuthenticationSessionId%22%3A%2200000000-0000-0000-0000-000000000000%22%2C%22CurrentAuthenticationSessionId%22%3A%2200000000-0000-0000-0000-000000000000%22%2C%22SignInState%22%3A%7B%7D%7D; X-VSS-UseRequestRouting=True")

$body = "{
`n    `"definitionId`": { `"id`": 23 },
`n    `"templateParamenters`": [
`n        { `"countyId`": `"007`" },
`n        { `"countyName`": `"MasterCounty`" },
`n        { `"farmId`": `"521`" },
`n        { `"prefix`": `"MasterPrefix`" },
`n        { `"imageLabel`": `"Ultimate`" }
`n    ]
`n}
`n"

$response = Invoke-RestMethod 'https://dev.azure.com/glenster75/jcc%20Bicep%20Demo/_apis/pipelines/23/runs?&api-version=6.1-preview.1' -Method 'POST' -Headers $headers -Body $body
$response | ConvertTo-Json
