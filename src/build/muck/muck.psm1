Get-ChildItem -Path $PSScriptRoot\*.ps1 -Exclude *.Tests.ps1 | Foreach-Object{ . $_.FullName }
Export-ModuleMember -Function * -Alias *
