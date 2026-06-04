$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$sourceDir = Join-Path $root 'source'
$outFile = Join-Path $root 'vaultbudget-source.zip'
$parts = Get-ChildItem -Path $sourceDir -Filter 'vaultbudget-source.zip.b64.part*' | Sort-Object Name

if (-not $parts) {
  throw "No source package chunks found in $sourceDir"
}

$builder = [System.Text.StringBuilder]::new()
foreach ($part in $parts) {
  [void]$builder.Append((Get-Content -Path $part.FullName -Raw).Trim())
}

[IO.File]::WriteAllBytes($outFile, [Convert]::FromBase64String($builder.ToString()))
Write-Host "Restored $outFile"
