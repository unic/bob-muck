<#
.SYNOPSIS
Removes the directory of a given manifest file.

.DESCRIPTION
Assumes, that the manifestFile is the only file in a directory and removes that directory recursively.

.PARAMETER ManifestFilePath
The path to the manifest file.

.EXAMPLE
Remove-PublishManifestDirectory -ManifestFilePath D:\temp\myManifest.pubxml

#>
function Remove-PublishManifestDirectory
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $ManifestFilePath
  )
  Process
  {
    $manifestFile = Get-Item -Path $ManifestFilePath

    $manifestDirectory = $manifestFile.Directory

    Remove-Item $manifestDirectory -Recurse
  }
}
