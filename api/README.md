# Muck - API

##  Add-RubbleArchiveFile
Adds a file or folder to a  ZIP file.    
    
    Add-RubbleArchiveFile [-Path] <String> [-ArchivePath] <String> [[-RelativeToPath] <String>] [<CommonParameters>]


 [Read more](Add-RubbleArchiveFile.md)
##  Copy-RubbleItem
Copies items in a folder based on a pattern to a specific location.    
    
    Copy-RubbleItem [-Path] <String> [-Destination] <String> [[-Pattern] <String[]>] [[-NoFilesAction] <String>] [<CommonParameters>]


 [Read more](Copy-RubbleItem.md)
##  Expand-RubbleArchive
Extracts a ZIP file.    
    
    Expand-RubbleArchive [-Path] <String> [-OutputLocation] <String> [<CommonParameters>]


 [Read more](Expand-RubbleArchive.md)
##  Get-RubblePattern
Transforms a string with patterns and placeholders to an array of patterns    
    
    Get-RubblePattern [-Pattern] <String> [[-Replacement] <Hashtable>] [<CommonParameters>]


 [Read more](Get-RubblePattern.md)
##  Get-ScProjectConfig
Reads the BOB configuration files and returns it as a hashtable    
    
    Get-ScProjectConfig [[-ProjectPath] <String>] [[-ConfigFileName] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]


 [Read more](Get-ScProjectConfig.md)
##  Get-ScProjectPath
Gets the full path of the Visual Studio Website project with the current context.    
    
    Get-ScProjectPath [[-ProjectPath] <String>] [[-ConfigFileName] <String[]>] [<CommonParameters>]


 [Read more](Get-ScProjectPath.md)
##  Invoke-BobCommand
If Invoke-BobCommand is called from the NuGet package manager console,
it will start a new process to run the command, else it just runs the specified code-block normally.    
    
    Invoke-BobCommand [-Code] <ScriptBlock> [<CommonParameters>]


 [Read more](Invoke-BobCommand.md)
##  New-PublishManifest
Generates a temporary publish manifest.    
    
    New-PublishManifest [-WebRoot] <String> [[-TempPath] <String>] [<CommonParameters>]


 [Read more](New-PublishManifest.md)
##  Remove-PublishManifestDirectory
Removes the directory of a given manifest file.    
    
    Remove-PublishManifestDirectory [-ManifestFilePath] <String> [<CommonParameters>]


 [Read more](Remove-PublishManifestDirectory.md)
##  Remove-RubbleItem
Removes all subfolders in a specific folder which doesn't match any of the specified patterns.    
    
    Remove-RubbleItem [-Folder] <String> [-Pattern] <String[]> [-Files] [<CommonParameters>]


 [Read more](Remove-RubbleItem.md)
##  Remove-WrongEnvironmentConfigs
Removes all folders in the include folder, which don't match the current envrionment and role.    
    
    Remove-WrongEnvironmentConfigs [-WebRoot] <String> [-Environment] <String> [-Role] <String> [-KeepFilter] <String> [<CommonParameters>]


 [Read more](Remove-WrongEnvironmentConfigs.md)
##  ResolvePath
    ResolvePath [[-PackageId] <Object>] [[-RelativePath] <Object>]


 [Read more](ResolvePath.md)
##  Set-ScUserConfigValue
Sets a config value in the Bob.config.user    
    
    Set-ScUserConfigValue [-Key] <String> [-Value] <String> [[-ProjectPath] <String>] [[-ConfigFileName] <String[]>] [<CommonParameters>]


 [Read more](Set-ScUserConfigValue.md)
##  Write-RubbleArchive
Writes the content of a folder to a ZIP file.    
    
    Write-RubbleArchive [-Path] <String> [-OutputLocation] <String> [<CommonParameters>]


 [Read more](Write-RubbleArchive.md)

