

# Remove-WrongEnvironmentConfigs

Removes all folders in the include folder, which don't match the current envrionment and role.
## Syntax

    Remove-WrongEnvironmentConfigs [-WebRoot] <String> [-Environment] <String> [-Role] <String> [-KeepFilter] <String> [<CommonParameters>]


## Description

Removes all folders in the App_Config\Include folder of the WebRoot,
which don't match the current environment and role.





## Parameters

    
    -WebRoot <String>
_The path to the WebRoot._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -Environment <String>
_The current environment, e.g. "local"_

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true |  | false | false |


----

    
    
    -Role <String>
_The current role, normally this is _delivery_ or _author_._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 3 | true |  | false | false |


----

    
    
    -KeepFilter <String>
_A semicolon separated list of patterns for folders to keep.
All folders inside `$WebRoot\App_Config\Include` which don't match any of this pattern, will be deleted.
The '$Environment' and '$Role' placeholder can be used here._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 4 | true |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    Remove-WrongEnvironmentConfigs -WebRoot D:\webs\my -Environment local -Role author -KeepFilter "00_base;*_$Role"































