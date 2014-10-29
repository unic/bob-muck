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
