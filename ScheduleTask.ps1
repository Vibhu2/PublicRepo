﻿Set-ExecutionPolicy Bypass -scope Process -Force
$Installpath= "C:\itconnexx-a"
$path=Test-Path "C:\itconnexx-a"
$ErrorActionPreference= 'silentlycontinue'
$UniversalStartup='C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp'

if (!(test-path $path) )
{New-Item C:\itconnexx-a -ItemType Directory}
Start-BitsTransfer -Source https://outlookclient.exclaimer.net/csua/Exclaimer.CloudSignatureUpdateAgent.Install.msi -Destination "$Installpath" -Verbose
Start-BitsTransfer -Source https://raw.githubusercontent.com/Vibhu2/PublicRepo/master/ImprovedDeployment.ps1 -Destination "$Installpath" -Verbose
Start-BitsTransfer -Source https://raw.githubusercontent.com/Vibhu2/PublicRepo/master/install.bat -Destination "$UniversalStartup" -Verbose

#Export-ScheduledTask -TaskName "Exclaimer Client Deployment" "\TASK-PATH-TASKSCHEDULER\" | Out-File C:\itconnexx-a\ExclaimerScriptDeploymet.xml
#Get-ScheduledTask -TaskName "Exclaimer Client Deployment" | Export-ScheduledTask | Out-File C:\itconnexx-a\ExclaimerScriptDeploymet.xml
#Register-ScheduledTask -xml (Get-Content "C:\itconnexx-a\ExclaimerScriptDeploymet.xml" | Out-String) -TaskName "exclaimer"
#Unregister-ScheduledTask -TaskName "exclaimer" -Confirm:$false