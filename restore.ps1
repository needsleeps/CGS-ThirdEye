# Third Eye (ตาทิพย์) - puts back the most recent backup of your own hint file.
$ErrorActionPreference = 'Stop'
$dir = Join-Path $env:APPDATA 'Godot\app_userdata\CityGameStudio'
if (Get-Process -Name 'CityGameStudio64' -ErrorAction SilentlyContinue) { throw 'City Game Studio is running. Close the game, then run this again.' }
$last = Get-ChildItem $dir -Filter 'game-tips.backup-*.json' | Sort-Object Name | Select-Object -Last 1
if (-not $last) { throw 'No backup found.' }
Copy-Item $last.FullName (Join-Path $dir 'game-tips.json') -Force
$tmp = Join-Path $dir 'game-tips.json.temp'
if (Test-Path $tmp) { Remove-Item $tmp }
Write-Host "Restored $($last.Name)"
