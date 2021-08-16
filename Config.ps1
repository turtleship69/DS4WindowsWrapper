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

function global:UpdateCheck()
{
    <#$releasesUrl = "https://api.github.com/repos/turtleship69/DS4WindowsWrapper/releases"
    $releaseResponse = Invoke-RestMethod -Uri $releasesUrl
    $releaseResponsejson = $releaseResponse | ConvertTo-Json
    $releaseResponsejson.tag_name
    if ($releaseResponse.tag_name -gt [version]'0.1.1')
    {
        $PlayniteApi.Dialogs.ShowMessage("New version " + $releaseResponse.tag_name + " available!")
        start "https://github.com/turtleship69/DS4WindowsWrapper/releases"
    }
    else 
    {
        $PlayniteApi.Dialogs.ShowMessage("You're on the lastest version!")
    }#>
    try {
        $releasesUrl = "https://api.github.com/repos/turtleship69/DS4WindowsWrapper/releases"
        $releaseResponse = Invoke-RestMethod -Uri $releasesUrl
        $releaseResponsejson = $releaseResponse | ConvertTo-Json
        $releaseResponsejson.tag_name
        if ($releaseResponse.tag_name -gt [version]'1.0.0')
        {
            $PlayniteApi.Dialogs.ShowMessage("New version " + $releaseResponse.tag_name + " available!")
            start "https://github.com/turtleship69/DS4WindowsWrapper/releases"
        }
        else 
        {
            $PlayniteApi.Dialogs.ShowMessage("You're on the lastest version!")
        }
    } catch {
        $errorMessage = $_.Exception.Message
        $PlayniteApi.Dialogs.ShowMessage("Error during update check. Error: {0}" -f $errorMessage)
        $__logger.Error("DS4Windows| $errorMessage")
    }
}



function global:debug()
{
	$config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
	$DS4CMDExecutablePath = ($config.DS4CMDLocation -split '=')[-1]
	$PlayniteApi.Dialogs.ShowMessage($DS4CMDExecutablePath)
	$DS4ExecutablePath = $config.DS4CMDLocation -replace 'cmd',''
	$PlayniteApi.Dialogs.ShowMessage($DS4ExecutablePath)
    $directory = & pwd
    $PlayniteApi.Dialogs.ShowMessage($directory)
}