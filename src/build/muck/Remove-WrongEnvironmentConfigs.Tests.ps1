$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"


$filters = @'
  *_base;
  *_hardening;
  *_$Environment;
  *_$Role;
  *_$Environment.$Role
'@

Describe "Remove-WrongEnvironmentConfigs" {
  Context "Roles" {
    mkdir "TestDrive:\App_Config\Include\10_delivery"
    mkdir "TestDrive:\App_Config\Include\10_author"

    Remove-WrongEnvironmentConfigs  -WebRoot "TestDrive:\" -Environment "dummy" -Role author -KeepFilter $filters

    It "Should have deleted delivery"  {
      Test-Path "TestDrive:\App_Config\Include\10_delivery" | Should Be $false
    }

    It "Should not have deleted author" {
      Test-Path "TestDrive:\App_Config\Include\10_author" | Should Be $true
    }
  }

  Context "Environments" {
    mkdir "TestDrive:\App_Config\Include\20_local"
    mkdir "TestDrive:\App_Config\Include\20_int"


    Remove-WrongEnvironmentConfigs  -WebRoot "TestDrive:\" -Environment "int" -Role "dummy" -KeepFilter $filters


    It "Should have deleted local" {
      Test-Path "TestDrive:\App_Config\Include\20_local" | Should Be $false
    }
    It "Should not have deleted int" {
      Test-Path "TestDrive:\App_Config\Include\20_int" | Should Be $true
    }
  }

  Context "Base and hardneing" {
    mkdir "TestDrive:\App_Config\Include\30_base"
    mkdir "TestDrive:\App_Config\Include\40_hardening"


    Remove-WrongEnvironmentConfigs  -WebRoot "TestDrive:\" -Environment "int" -Role "dummy" -KeepFilter $filters


    It "Should not have deleted base" {
      Test-Path "TestDrive:\App_Config\Include\30_base" | Should Be $true
    }
    It "Should not have deleted hardening" {
      Test-Path "TestDrive:\App_Config\Include\40_hardening" | Should Be $true
    }
  }

  Context "Recursive" {
    mkdir "TestDrive:\App_Config\Include\10\base"
    mkdir "TestDrive:\App_Config\Include\10\dummy\base"
    mkdir "TestDrive:\App_COnfig\Include\20"
    mkdir "TestDrive:\App_COnfig\Include\30\dummy"

    Remove-WrongEnvironmentConfigs  -KeepFilter "*base"  -WebRoot "TestDrive:\" -Environment "int" -Role "dummy"

    It "Should not have deleted folders" {
      Test-Path "TestDrive:\App_Config\Include\10\base" | Should Be $true
      Test-Path "TestDrive:\App_Config\Include\10\dummy\base" | Should Be $true

    }

    It "Should have deleted folders "{
      Test-Path "TestDrive:\App_Config\Include\20" | Should Be $false
      Test-Path "TestDrive:\App_Config\Include\30\dummy" | Should Be $false
    }


  }

}
