<#
.SYNOPSIS
Generates a temporary publish manifest.

.DESCRIPTION
Generates a temporary publish manifest to be used for publishing 
mainly dotnet core projects.

.PARAMETER WebRoot
The path to the WebRoot.

.PARAMETER TempPath
A temp path which the build process should use.

.EXAMPLE
New-PublishManifest -WebRoot D:\webs\my

#>
function New-PublishManifest
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $WebRoot,
      [string] $TempPath = $env:TEMP
  )
  Process
  {
    $tempPath = "$TempPath\$([guid]::NewGuid().Guid)"
    mkdir $tempPath | out-null

    $publishManifestProfilePath = "$tempPath\localIisPublish.pubxml"

    @"
<?xml version="1.0" encoding="utf-8"?>
<!--
This file is used by the publish/package process of your Web project. You can customize the behavior of this process
by editing this MSBuild file. In order to learn more about this please visit http://go.microsoft.com/fwlink/?LinkID=208121. 
-->
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <WebPublishMethod>FileSystem</WebPublishMethod>
    <publishUrl>$WebRoot</publishUrl>
    <DeleteExistingFiles>False</DeleteExistingFiles>
    <IgnoreProjectGuid>false</IgnoreProjectGuid>
  </PropertyGroup>
</Project>
"@ | Out-File $publishManifestProfilePath -Encoding UTF8

    return $publishManifestProfilePath
  }
}
