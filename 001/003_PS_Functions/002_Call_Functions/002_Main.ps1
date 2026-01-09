# Main.ps1

# Resolve current script directory
$scriptRoot = $PSScriptRoot

# Import functions (dot-source)
. "$scriptRoot\ps_functions.ps1"

# Now you can use Get-ParentPath
$currentPath = $PSScriptRoot

$projectRoot = Get-ParentPath -Path $currentPath -Levels 1
$repoRoot    = Get-ParentPath -Path $currentPath -Levels 2

[System.Environment]::NewLine
Write-Host "Current Path : $currentPath"
[System.Environment]::NewLine
Write-Host "Project Root : $projectRoot"
[System.Environment]::NewLine
Write-Host "Repo Root    : $repoRoot"
[System.Environment]::NewLine
