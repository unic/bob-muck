

# Remove-PublishManifestDirectory

Removes the directory of a given manifest file.
## Syntax

    Remove-PublishManifestDirectory [-ManifestFilePath] <String> [<CommonParameters>]


## Description

Assumes, that the manifestFile is the only file in a directory and removes that directory recursively.





## Parameters

    
    -ManifestFilePath <String>
_The path to the manifest file._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    Remove-PublishManifestDirectory -ManifestFilePath D:\temp\myManifest.pubxml































