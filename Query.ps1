function global:Invoke-ExecuteQuery()
{
    param(
        [string] $query,
        [string] $message
    )

    $config = Get-Content "$CurrentExtensionDataPath\config.json"| ConvertFrom-Json
    $DS4CMDExecutablePath = ($config.DS4CMDLocation -split '=')[-1]
    $responce = & "C:\Users\tamkh\Documents\general apps\DS4Windows\DS4WindowsCmd.exe" -command Query.1.$query
    $PlayniteApi.Dialogs.ShowMessage($message + $responce)
}


function global:QueryProfileName()
{
    Invoke-ExecuteQuery "ProfileName" "Your current profile is: "
}

function global:QueryOutContType()
{
    Invoke-ExecuteQuery "OutContType" "Your current emulated controller name is: "
}

function global:QueryDisplayName()
{
    Invoke-ExecuteQuery "DisplayName" "Your current controllers' name is is: "
}

function global:QueryConnType()
{
    Invoke-ExecuteQuery "ConnType" "Your current connection type is: "
}

function global:QueryBattery()
{
    Invoke-ExecuteQuery "Battery"  "Your current battery level is: "
    Invoke-ExecuteQuery "Charging" "Your controller is charging? "
}

# function global:QueryCharging ()
# {
#     Invoke-ExecuteQuery "Charging"
# }

