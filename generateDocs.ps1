$PSScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition

$module = "Muck"

Import-Module "$PSScriptRoot\packages\Unic.Bob.Keith\Keith"
Import-Module "$PSScriptRoot\src\build\$module" -Force

New-PsDoc -Module $module -Path "$PSScriptRoot\docs\" -OutputLocation "$PSScriptRoot\docs-generated"

gitbook build "$PSScriptRoot\docs-generated\"

