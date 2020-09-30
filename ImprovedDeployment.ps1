# This part of the script is just to prepare the enviornment

Set-ExecutionPolicy Bypass -scope Process -Force
$Installpath= "C:\itconnexx-a"
$path=Test-Path "C:\itconnexx-a"
$ErrorActionPreference= 'silentlycontinue'
$UniversalStartup='C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp'

if (!(test-path $path) )
{New-Item C:\itconnexx-a -ItemType Directory}
Start-BitsTransfer -Source https://outlookclient.exclaimer.net/csua/Exclaimer.CloudSignatureUpdateAgent.Install.msi -Destination "$Installpath" -Verbose
Start-BitsTransfer -Source https://raw.githubusercontent.com/Vibhu2/PublicRepo/master/ImprovedDeployment.ps1 -Destination "$Installpath" -Verbose
Start-BitsTransfer -Source https://raw.githubusercontent.com/Vibhu2/PublicRepo/master/install.bat -Destination "$UniversalStartup" -Verbose

#this part of the script checks for the installed software and if not installed for the user it deploys it.

$username=$env:USERNAME

$Result=Test-Path -Path "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Exclaimer\Cloud Signature Update Agent.lnk"

if (!(test-path $Result) ){

    Set-ExecutionPolicy Bypass -scope Process -Force
    Get-Process *installer* | Stop-Process -Force
    $ErrorActionPreference= 'silentlycontinue'

    $Installpath= "C:\itconnexx-a"
    $path=Test-Path "C:\itconnexx-a"

    if (!(test-path $path) ){New-Item C:\itconnexx-a -ItemType Directory}

    Start-Process -FilePath 'C:\itconnexx-a\Exclaimer.CloudSignatureUpdateAgent.Install.msi' -PassThru '/quiet -m'
    #Start-Sleep -Seconds 60
    #Remove-Item 'C:\itconnexx-a\Exclaimer.CloudSignatureUpdateAgent.Install.msi'
    #Remove-Item 'C:\itconnexx-a\ExclaimerScriptDeploymet.xml'
    #Remove-Item 'C:\itconnexx-a\ExclaimerScriptDeploymet.ps1'
}
