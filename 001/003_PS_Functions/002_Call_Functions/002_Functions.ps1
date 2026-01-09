# ps_functions.ps1

function Get-ParentPath {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [int]$Levels = 1
    )

    $current = Get-Item $Path

    for ($i = 1; $i -le $Levels; $i++) {
        if (-not $current.Parent) {
            throw "Cannot move $Levels levels up from path: $Path"
        }
        $current = $current.Parent
    }

    return $current.FullName
}
