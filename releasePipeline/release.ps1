Write-Host username: ${env:username}
Write-Host personalaccesstoken: ${env:personalaccesstoken}

$pair = "${env:username}:${env:personalaccesstoken}"
Write-Host pair: $pair

$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
Write-Host bytes: $bytes

$base64 = [System.Convert]::ToBase64String($bytes)
Write-Host base64: $base64

$basicAuthValue = "Basic $base64"
Write-Host basicAuthValue: $basicAuthValue
Write-Host LookingFor: "Basic Z2xlbnN0ZXI3NUBob3RtYWlsLmNvbToydzZ1bnN4eW4zMnppaDJwaDR1NWp4dWdsdHZpbjVtZG96cDJvYWZhNWRkdjI2YW5xZ2tx"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
#$headers.Add("Authorization", "Basic $base64")
$headers.Add("Authorization", "$basicAuthValue")
#$headers.Add("Authorization", "Basic Z2xlbnN0ZXI3NUBob3RtYWlsLmNvbToydzZ1bnN4eW4zMnppaDJwaDR1NWp4dWdsdHZpbjVtZG96cDJvYWZhNWRkdjI2YW5xZ2tx")

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
