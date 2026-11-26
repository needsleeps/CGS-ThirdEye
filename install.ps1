# Third Eye (ตาทิพย์) - installs the complete hint file for City Game Studio.
# Usage:  powershell -ExecutionPolicy Bypass -File install.ps1            (base game)
#         powershell -ExecutionPolicy Bypass -File install.ps1 -MegaDLC   (base game + CGS Mega DLC content)
# Close the game first. Your current hint file is backed up next to it before being replaced.
param([switch]$MegaDLC)

$ErrorActionPreference = 'Stop'
$dir = Join-Path $env:APPDATA 'Godot\app_userdata\CityGameStudio'
if (-not (Test-Path $dir)) { throw "City Game Studio user folder not found: $dir (start the game once first)" }
if (Get-Process -Name 'CityGameStudio64' -ErrorAction SilentlyContinue) { throw 'City Game Studio is running. Close the game, then run this again.' }

$pack = Join-Path $PSScriptRoot $(if ($MegaDLC) { 'game-tips.megadlc.json' } else { 'game-tips.base.json' })
if (-not (Test-Path $pack)) { throw "Hint pack not found: $pack" }
$target = Join-Path $dir 'game-tips.json'

if (Test-Path $target) {
  $backup = Join-Path $dir ("game-tips.backup-{0}.json" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
  Copy-Item $target $backup
  Write-Host "Backup of your own hints: $backup"
}
Copy-Item $pack $target -Force
$tmp = Join-Path $dir 'game-tips.json.temp'
if (Test-Path $tmp) { Remove-Item $tmp }

Write-Host "Installed $(Split-Path $pack -Leaf)."
Write-Host 'Start a NEW game and tick the "keep hints" option on the new-game screen.'
