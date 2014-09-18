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
    foreach($filterPart in $KeepFilter.Split(';')) {
      $filterPart = $filterPart.Trim()
      $filterPart = $filterPart.Replace('$Environment', $Environment)
      $filterPart = $filterPart.Replace('$Role', $Role)
      foreach($folder in (ls $rootDir -recurse | Where {$_.PSIsContainer})) {
        if($folder.FullName.Replace($rootDir, "") -like $filterPart) {
          $itemsToKeep += $folder.FullName
        }
      }
    }
    foreach($item in (ls "$rootDir" -Recurse | Where {$_.PSIsContainer -eq $true})) {
      $delete = $true;
      foreach($keep in $itemsToKeep) {
        if($keep.StartsWith($item.FullName)) {
          $delete = $false
          break;
        }
      }

      if($delete -and (Test-Path $item.FullName)) {
          $item.FullName
          rm $item.FullName -Recurse
      }
    }
  }
}
