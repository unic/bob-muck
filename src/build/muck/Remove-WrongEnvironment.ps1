function Remove-WrongEnvironment
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $WebRoot,
      [Parameter(Mandatory=$true)]
      [string] $Environment ,
      [Parameter(Mandatory=$true)]
      [string] $Role
  )
  Process
  {
    $rootDir = "$WebRoot\App_Config\Include"
    $itemsToKeep = @()
    $itemsToKeep += (ls "$rootDir\*_base\").FullName
    $itemsToKeep += (ls "$rootDir\*_hardening\").FullName
    $itemsToKeep += (ls "$rootDir\*_$Environment\").FullName
    $itemsToKeep += (ls "$rootDir\*_$Role\").FullName
    $itemsToKeep += (ls "$rootDir\*_$Environment.$Role\").FullName

    foreach($item in (ls $rootDir | Where {$_.PSIsContainer -eq $true})) {

      if(-not ($itemsToKeep.Contains($item.FullName))) {
        rm $item.FullName -Recurse
      }
    }
  }
}
