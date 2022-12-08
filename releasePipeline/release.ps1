$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Authorization", ${env:basicAuth})

$body = "{
`n    `"definitionId`": { `"id`": 23 },
`n    `"templateParameters`": {
`n        `"CountyId`": `"007`",
`n        `"CountyName`": `"MasterCounty`",
`n        `"FarmId`": `"521`",
`n        `"Prefix`": `"MasterPrefix`",
`n        `"ImageLabel`": `"Ultimate`",
`n        `"Test`": `"001|1|CountyA`n002|1|CountyB`n003|2|CountyC`"
`n    }
`n}
`n"

$response = Invoke-RestMethod 'https://dev.azure.com/glenster75/jcc%20Bicep%20Demo/_apis/pipelines/23/runs?&api-version=6.1-preview.1' -Method 'POST' -Headers $headers -Body $body
$response | ConvertTo-Json
