<#
.SYNOPSIS
Removes all folders in the include folder, which don't match the current envrionment and role.

.DESCRIPTION
Removes all folders in the App_Config\Include folder of the WebRoot,
which don't match the current environment and role.


.PARAMETER WebRoot
The path to the WebRoot.

.PARAMETER Environment
The current environment, e.g. "local"

.PARAMETER Role
The current role, normally this is _delivery_ or _author_.

.PARAMETER KeepFilter
A semicolon separated list of patterns for folders to keep.
All folders inside `$WebRoot\App_Config\Include` which don't match any of this pattern, will be deleted.
The '$Environment' and '$Role' placeholder can be used here.

.EXAMPLE
Remove-WrongEnvironmentConfigs -WebRoot D:\webs\my -Environment local -Role author -KeepFilter "00_base;*_$Role"

#>
function Remove-WrongEnvironmentConfigs
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $WebRoot,
      [Parameter(Mandatory=$true)]
      [string] $Environment ,
      [Parameter(Mandatory=$true)]
      [string] $Role,
      [Parameter(Mandatory=$true)]
      [string] $KeepFilter
  )
  Process
  {
    $rootDir = "$WebRoot\App_Config\Include"
    $itemsToKeep = @()
    $pattern = Get-RubblePattern $KeepFilter @{'$Environment'= $Environment; '$Role'= $Role}
    Remove-RubbleItem $rootDir $pattern
  }
}
