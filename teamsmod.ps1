$adminUPN="mail@tobiaswolter.de"
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
#Connect-SPOService -Url "https://tobiaswolter-admin.sharepoint.com" -Credential $userCredential
Connect-MicrosoftTeams -TenantId "26dfeab2-7b86-4967-b7fe-656976fa09de" -Credential $userCredential
#Install-Module -Name ExchangeOnlineManagement
Connect-ExchangeOnline

Function Set-Url{
  Param ($URL,$SharePointSiteUrl)
# $con =  
$SharePointSiteUrl
 Connect-PnPOnline $SharePointSiteUrl -Credentials $userCredential
 $node = Get-PnPNavigationNode  -Location QuickLaunch  | Where-Object {$_.Title -eq "New-Chat"}
if(!$node)
{
 Add-PnPNavigationNode -Title "New-Chat" -Url $URL -Location "QuickLaunch" 
}

Disconnect-PnPOnline 
  }



$groups = Get-UnifiedGroup 
#$groups | Select-Object SharePointSiteUrl
foreach($group in $groups )
{
      $group.SharePointSiteUrl
      $teamchannels = Get-TeamChannel -GroupId $group.ExternalDirectoryObjectId -ErrorAction:Ignore
     # $teamchannels
      if(!$teamchannels)
      {
        return}

      $teamLinkTemplate = "https://teams.microsoft.com/l/team/<ThreadId>/conversations?groupId=<GroupId>&tenantId=<TenantId>"
      $teamLink = $teamLinkTemplate.Replace("<ThreadId>",$teamchannels[0].Id).Replace("<GroupId>",$group.Id).Replace("<TenantId>","26dfeab2-7b86-4967-b7fe-656976fa09de")

      if($group.SharePointSiteUrl)
      {
        Set-Url -URL $teamLink -SharePointSiteUrl $group.SharePointSiteUrl
      }

}