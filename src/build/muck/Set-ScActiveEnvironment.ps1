<#
.SYNOPSIS
Sets the active environment

.DESCRIPTION
Sets the active environment based on the ActiveEnvironment property in the Bob.config.

.PARAMETER Environment
The environment to set.

.EXAMPLE
Set-ScActiveEnvironment preview

#>
function Set-ScActiveEnvironment
{
  [CmdletBinding()]
  Param(
      [Parameter(Mandatory=$true)]
      [string] $Environment
  )
  Process
  {
      $config = Get-ScProjectConfig

      Set-ScUserConfigValue -Key "ActiveEnvironment" -Value $Environment

      if ($dte) {

        $dte.Solution.SolutionBuild.Build()
        
     }
     
  }
}
