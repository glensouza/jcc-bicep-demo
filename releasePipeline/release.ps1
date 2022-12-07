Write-Host username: $(username)
$pair = "$(username):$(personalaccesstoken)"
$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
$base64 = [System.Convert]::ToBase64String($bytes)
$basicAuthValue = "Basic $base64"


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Authorization", $basicAuthValue)

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

$response = Invoke-RestMethod 'https://dev.azure.com/glenster75/jcc%20Bicep%20Demo/_apis/pipelines/23/runs?&api-version=6.1-preview.1' -Method 'POST' -Headers $headers -Body $body
$response | ConvertTo-Json
