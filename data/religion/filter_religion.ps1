$inputFile = "$PSScriptRoot\..\Religion.jsonl"
$outputFile = "$PSScriptRoot\religion2.jsonl"

$totalItems = 0
$filteredItems = 0

# Check if input file exists
if (-not (Test-Path $inputFile)) {
    Write-Error "Input file not found: $inputFile"
    exit 1
}

Get-Content $inputFile | ForEach-Object {
    $totalItems++
    $item = $_ | ConvertFrom-Json
    
    # Check if item matches filter criteria
    if ($item.question_polarity -eq "nonneg" -and $item.context_condition -eq "disambig") {
        $_ | Out-File -Append -Encoding utf8 -FilePath $outputFile
        $filteredItems++
    }
}

Write-Host "Total items processed: $totalItems"
Write-Host "Items matching criteria: $filteredItems"
Write-Host "Filtered data saved to $outputFile" 