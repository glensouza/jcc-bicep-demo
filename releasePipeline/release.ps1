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

$body = "{
`n    `"definitionId`": { `"id`": 23 },
`n    `"templateParamenters`": [
`n        { `"countyId`": `"007`" },
`n        { `"countyName`": `"MasterCounty`" },
`n        { `"farmId`": `"521`" },
`n        { `"Prefix`": `"MasterPrefix`" },
`n        { `"ImageLabel`": `"Ultimate`" }
`n    ]
`n}
`n"
