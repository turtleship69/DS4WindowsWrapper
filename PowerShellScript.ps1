function global:GetMainMenuItems()
{
    param($menuArgs)

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
    $menuItem4.Description = "debug"
    $menuItem4.FunctionName = "debug"
	$menuItem4.MenuSection = "DS4Windows|Config"
	
    $menuItem5 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem5.Description = "Open DS4Windows' main app"
    $menuItem5.FunctionName = "bootUp"
	$menuItem5.MenuSection = "DS4Windows"
	
    $menuItem6 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem6.Description = "Start"
    $menuItem6.FunctionName = "startDS4"
	$menuItem6.MenuSection = "DS4Windows"

    $menuItem7 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem7.Description = "Stop"
    $menuItem7.FunctionName = "stopDS4"
	$menuItem7.MenuSection = "DS4Windows"

    $menuItem8 = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $menuItem8.Description = "Close DS4Windows' main app"
    $menuItem8.FunctionName = "shutdownDS4"
	$menuItem8.MenuSection = "DS4Windows"

    return $menuItem1, $menuItem2, $menuItem3, $menuItem4, $menuItem5, $menuItem6, $menuItem7, $menuItem8
}



function global:DownloadDS4Windows()
{
	start "https://ryochan7.github.io/ds4windows-site/"
}

function global:DownloadDS4WindowsCMD()
{
	start "https://github.com/mika-n/DS4WindowsCmd"
}

function global:ConfigurePaths()
{
	$DS4CMDExecutablePath = $PlayniteApi.Dialogs.SelectFile("DS4WindowsCMD|DS4WindowsCMD.exe")
    if (!$DS4CMDExecutablePath)
    {
        exit
    }
	$PlayniteApi.Dialogs.ShowMessage($DS4CMDExecutablePath)
	@{DS4CMDLocation = $DS4CMDExecutablePath} | ConvertTo-Json | Out-File "$CurrentExtensionDataPath\config.json"
}

function global:debug()
{
	$config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
	$DS4CMDExecutablePath = ($config.DS4CMDLocation -split '=')[-1]
	$PlayniteApi.Dialogs.ShowMessage($DS4CMDExecutablePath)
	$DS4ExecutablePath = $config.DS4CMDLocation -replace 'cmd',''
	$PlayniteApi.Dialogs.ShowMessage($DS4ExecutablePath)
}


function global:bootUp()
{
	$config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
	$DS4ExecutablePath = $config.DS4CMDLocation -replace 'cmd',''
	start-process $DS4ExecutablePath
}

function global:startDS4()
{
    $config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
    $DS4CMDExecutablePath = ($config.DS4CMDLocation -split '=')[-1]
    #$PlayniteApi.Dialogs.ShowMessage($DS4CMDExecutablePath)
    Start-Process -FilePath "$DS4CMDExecutablePath" -ArgumentList "-command start" 
}

function global:stopDS4()
{
    $config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
    $DS4CMDExecutablePath = ($config.DS4CMDLocation -split '=')[-1]
    #$PlayniteApi.Dialogs.ShowMessage($DS4CMDExecutablePath)
    Start-Process -FilePath "$DS4CMDExecutablePath" -ArgumentList "-command stop" 
}

function global:shutdownDS4()
{
    $config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
    $DS4CMDExecutablePath = ($config.DS4CMDLocation -split '=')[-1]
    #$PlayniteApi.Dialogs.ShowMessage($DS4CMDExecutablePath)
    Start-Process -FilePath "$DS4CMDExecutablePath" -ArgumentList "-command shutdown" 
}
