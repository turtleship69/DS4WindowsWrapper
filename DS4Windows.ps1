function global:GetMainMenuItems()
{
    param($menuArgs)

    . $CurrentExtensionInstallPath\Config.ps1
    . $CurrentExtensionInstallPath\Main.ps1
    . $CurrentExtensionInstallPath\Query.ps1

    $menuItem1 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem1.Description = "Download DS4Windows (fork by ryochan7)"
    $menuItem1.FunctionName = "DownloadDS4Windows"
	$menuItem1.MenuSection = "DS4Windows|Config"
	
    $menuItem2 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem2.Description = "Download DS4WindowsCMD (for passing command line parameters to DS4Windows)"
    $menuItem2.FunctionName = "DownloadDS4WindowsCMD"
	$menuItem2.MenuSection = "DS4Windows|Config"
	
    $menuItem3 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem3.Description = "Configure path (Of DS4WindowsCMD)"
    $menuItem3.FunctionName = "ConfigurePaths"
	$menuItem3.MenuSection = "DS4Windows|Config"

    $menuItem4 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem4.Description = "Check for updates"
    $menuItem4.FunctionName = "UpdateCheck"
	$menuItem4.MenuSection = "DS4Windows|Config"

    $menuItem5 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem5.Description = "debug"
    $menuItem5.FunctionName = "debug"
	$menuItem5.MenuSection = "DS4Windows|Config"

    $menuItem6 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem6.Description = "Check current profile"
    $menuItem6.FunctionName = "QueryProfileName"
	$menuItem6.MenuSection = "DS4Windows|Query"

    $menuItem7 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem7.Description = "Check emulated controller type"
    $menuItem7.FunctionName = "QueryOutContType"
	$menuItem7.MenuSection = "DS4Windows|Query"

    $menuItem8 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem8.Description = "Check current controller name"
    $menuItem8.FunctionName = "QueryDisplayName"
	$menuItem8.MenuSection = "DS4Windows|Query"

    $menuItem9 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem9.Description = "Check connection type"
    $menuItem9.FunctionName = "QueryConnType"
	$menuItem9.MenuSection = "DS4Windows|Query"

    $menuItem10 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem10.Description = "Check battery level and status"
    $menuItem10.FunctionName = "QueryBattery"
	$menuItem10.MenuSection = "DS4Windows|Query"
	
    $menuItem11 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem11.Description = "Open DS4Windows' main app"
    $menuItem11.FunctionName = "bootUp"
	$menuItem11.MenuSection = "DS4Windows"
	
    $menuItem12 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem12.Description = "Start"
    $menuItem12.FunctionName = "startDS4"
	$menuItem12.MenuSection = "DS4Windows"

    $menuItem13 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem13.Description = "Stop"
    $menuItem13.FunctionName = "stopDS4"
	$menuItem13.MenuSection = "DS4Windows"

    $menuItem14 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem14.Description = "Close DS4Windows' main app"
    $menuItem14.FunctionName = "shutdownDS4"
	$menuItem14.MenuSection = "DS4Windows"

    return $menuItem1, $menuItem2, $menuItem3, $menuItem4, $menuItem5, $menuItem6, $menuItem7, $menuItem8, $menuItem9, $menuItem10, $menuItem11, $menuItem12, $menuItem13, $menuItem14
}

