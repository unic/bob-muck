

# New-PublishManifest

Generates a temporary publish manifest.
## Syntax

    New-PublishManifest [-WebRoot] <String> [[-TempPath] <String>] [<CommonParameters>]


## Description

Generates a temporary publish manifest to be used for publishing 
mainly dotnet core projects.





## Parameters

    
    -WebRoot <String>
_The path to the WebRoot._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -TempPath <String>
_A temp path which the build process should use._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | false | $env:TEMP | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    New-PublishManifest -WebRoot D:\webs\my































