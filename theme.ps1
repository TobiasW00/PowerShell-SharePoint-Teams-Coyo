$adminUPN="mail@tobiaswolter.de"
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
Connect-SPOService -Url "https://tobiaswolter-admin.sharepoint.com" -Credential $userCredential

$themepallette = @{
    "themePrimary" = "#0e7fd6";
    "themeLighterAlt" = "#f4f9fd";
    "themeLighter" = "#d3e8f8";
    "themeLight" = "#afd5f3";
    "themeTertiary" = "#66afe7";
    "themeSecondary" = "#288ddb";
    "themeDarkAlt" = "#0d73c1";
    "themeDark" = "#0b61a3";
    "themeDarker" = "#084878";
    "neutralLighterAlt" = "#f8f8f8";
    "neutralLighter" = "#f4f4f4";
    "neutralLight" = "#eaeaea";
    "neutralQuaternaryAlt" = "#dadada";
    "neutralQuaternary" = "#d0d0d0";
    "neutralTertiaryAlt" = "#c8c8c8";
    "neutralTertiary" = "#595959";
    "neutralSecondary" = "#373737";
    "neutralPrimaryAlt" = "#2f2f2f";
    "neutralPrimary" = "#000000";
    "neutralDark" = "#151515";
    "black" = "#0b0b0b";
    "white" = "#ffffff";
    "primaryBackground" = "#ffffff";
    "primaryText" = "#000000";
    "bodyBackground" = "#ffffff";
    "bodyText" = "#000000";
    "disabledBackground" = "#f4f4f4";
    "disabledText" = "#c8c8c8";
    }

    #Add-SPOTheme -Name "Tobias Wolter - Video" -Palette $themepallette -IsInverted $false -Overwrite
    #Get-SPOTheme
    Set-SPOHideDefaultThemes $false

    
