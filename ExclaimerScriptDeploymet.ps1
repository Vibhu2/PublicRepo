$username=$env:USERNAME

$Result=Test-Path -Path "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Exclaimer\Cloud Signature Update Agent.lnk"

if($Result=

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

