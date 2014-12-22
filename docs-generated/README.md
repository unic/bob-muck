<div class="chapterlogo">![Muck](Muck.png)</div>
# Muck

Muck is responsible for deploying a Sitecore Website or a Sitecore Module locally from Visual Studio. Muck provides a NuGet package, which provides MSBuild functionallity to perform the build with web deploy based on the Bob config files. Addionaly to the out-of-the-box web deploy features, Muck adds following steps during local deployment:

* perform multi-step web.config transformatoin
* remove App_Config\Include folders from other environments based on a naming convention
* recycle app pool


## How to use Muck in my Project?

To install Muck into your project simply install the NuGet package "Unic.Bob.Muck"

    PM> Install-Package Unic.Bob.Muck

After the package is installed, a deployment will be done on each build started inside Visual Studio. Muck can be easily configured with the Bob.config configuration files. Following Keys will be used:

| Key | Description | Example | Default |
| --- | --- | --- | --- |
| ActiveRole |	The role which Muck will deploy to. This is used for Web.config transform and for cleaning up the "Include" folder.	| `<MuckRole>delivery</MuckRole>` |  |
| WebFolderName |	The name of the folder inside [GlobalWebPath]\[WebsiteCodeName] which contains the WebRoot	| `<WebFolderName>Web</WebFolderName>` |  |
| WebsiteCodeName |	The name of IIS site and application pool. | `<WebsiteCodeName>post-internet</WebsiteCodeName>` |  |
| GlobalWebPath |	Path to the folder where all sites are located |	`<GlobalWebPath>D:\Web</GlobalWebPath>`	 |  |
| MuckRecyleAppPool |	If true, the application pool will be recycled after a Muck deployment.	| `<MuckRecyleAppPool>true</MuckRecyleAppPool>` |	false |
| WebRoot |	If this parameter is set, the Website or the Module will be deployed to this path.	| `<WebRoot>D:\web\playground-demo</WebRoot>` |	GlobalWebPath + WebsiteCodeName + WebFolderName |
| KeepAppConfigIncludes | A list containing all patterns for folders inside "App\_Config\Include" which should not be deleted after deployment. '$Environment' and '$Role' can used as placeholders. On local "deployments" by Muck, $Environment will be automatically set to "local". | `<KeepAppConfigIncludes>`<br>&nbsp;&nbsp;`\*\_base;`<br>&nbsp;&nbsp;`\*\_$Environment;`<br>&nbsp;&nbsp;`\*\_$Role;`<br>&nbsp;&nbsp;`\*\_$Environment.$Role`<br>`</KeepAppConfigIncludes>` | &nbsp; |

After the installation when performing a build inside Visual Studio following actions will be done:
* Web Deploy to `$(GlobalWebPath)\$(WebsiteCodeName)\$(GlobalWebPath)`
* Transform `Web.*.config` in this order:
* Web.debug.config
    * Web.base.config
    * Web.$(ActiveRole).config
    * Web.local.config
    * Web.local.$(ActiveRole).config
* Delete folders in `App_Config\Include` which do not match the $(KeepAppConfigIncludes) pattern
* If $(MuckRecyleAppPool) is set to true, the application pool will be recycled


### How can I include/exclude some files

Web Deploy takes all files which have the build action "Content" in Visual Studio. If you want to exclude some files can set the build action to "None" in Visual Studio.
Environments and Roles


### Environments and Roles

An "environment" is defined as a logical system of one or more Sitecore instances running on one or more servers. Examples for environments are: dev, preview, int, prod etc.

A "role" is defined as a Sitecore specific configuration. Sitecore can either be set up as an "author" or as a "delivery" role.
Module development


## Module development

Basically Muck can be used in Modules as it would be used in Websites. Simply install Muck in your Website project of your Module and set the "WebRoot" parameter in Bob config.
Technical Documentation


## Technical Documentation

Muck contains of different components, which are documented in the following sub-chapters.
Unic.Bob.Muck.props


### Unic.Bob.Muck.props

This MSBuild project contains all PowerShell tasks and static properties used by Muck.
Unic.Bob.Muck.targets


### Unic.Bob.Muck.targets

Contains all targets used during  build  and define which target should be run when.
XmlTransforms.target


### XmlTransforms.target

Contains all targets which are used for the MuckXmlTransform. This targets are based on the targets used by Web Deploy for Web.config transform  based on profile.
Muck PowerShell Module


### Muck PowerShell Module

A PowerShell Module which contains Cmdlets used by MSBuild tasks.
