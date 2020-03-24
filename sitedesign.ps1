# Install-Module SharePointPnPPowerShellOnline        
$adminUPN="mail@tobiaswolter.de"
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
Connect-PnPOnline "https://tobiaswolter-admin.sharepoint.com" -Credentials $userCredential
#Add-PnPSiteScript -Content (Get-Content 'sitedesign.json' -Raw)  -Title "Tobias Wolter-Site Script V4"  -Description "Hinzufügen und Entfernen von Menüpunkten"



Add-PnPSiteDesign `
-Title "Video theme - V2" `
-WebTemplate "64" `
-SiteScriptIds "9791423d-2600-4f46-a622-8ab332791f74" `
-Description "Beschreibung aus dem Video" `
-IsDefault
