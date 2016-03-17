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
      Write-Warning "Work started"
      
      $config = Get-ScProjectConfig
    
      Write-Warning $config
      Write-Warning "Config written"
      
      Set-ScUserConfigValue -Key "ActiveEnvironment" -Value $Environment
      
      Write-Warning "ActiveEnvironment set"
      
      if ($dte) {
        Write-Warning $dte
        
        $dte.Solution.SolutionBuild.Build()
        
        Write-Warning "Solution built"
     }
     
  }
}
