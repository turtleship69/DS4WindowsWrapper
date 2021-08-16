function global:bootUp()
{
	$config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
	$DS4ExecutablePath = $config.DS4CMDLocation -replace 'cmd',''
	start-process $DS4ExecutablePath
}

function global:Invoke-ExecuteCommand 
#shout out to darklinkpower for reminding me that functions are a thing which don't need to be written out every time, and have parameter.
#in the last version i literally had basically this but the $command parameter hard coded for EVERY command.
{
    param(
        [string] $command
    )

    $config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
    $DS4CMDExecutablePath = ($config.DS4CMDLocation -split '=')[-1]
    #$PlayniteApi.Dialogs.ShowMessage($DS4CMDExecutablePath)
    Start-Process -FilePath "$DS4CMDExecutablePath" -ArgumentList "-command $command"
}

function global:startDS4()
{
    Invoke-ExecuteCommand "start"
}

function global:stopDS4()
{
    Invoke-ExecuteCommand "stop"
}

function global:shutdownDS4()
{
    Invoke-ExecuteCommand "shutdown"
}