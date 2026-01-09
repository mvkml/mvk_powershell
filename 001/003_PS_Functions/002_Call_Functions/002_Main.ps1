# Main.ps1

# Resolve current script directory
$scriptRoot = $PSScriptRoot

# Import functions (dot-source)
. "$scriptRoot\ps_functions.ps1"

# Now you can use Get-ParentPath
$currentPath = $PSScriptRoot

$projectRoot = Get-ParentPath -Path $currentPath -Levels 1
$repoRoot    = Get-ParentPath -Path $currentPath -Levels 2

Write-Host "Current Path : $currentPath"
Write-Host "Project Root : $projectRoot"
Write-Host "Repo Root    : $repoRoot"
