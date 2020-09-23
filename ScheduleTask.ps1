Set-ExecutionPolicy Bypass -scope Process -Force
$Installpath= "C:\itconnexx-a"
$path=Test-Path "C:\itconnexx-a"

if (!(test-path $path) )
{New-Item C:\itconnexx-a -ItemType Directory}
Start-BitsTransfer -Source https://outlookclient.exclaimer.net/csua/Exclaimer.CloudSignatureUpdateAgent.Install.msi -Destination "$Installpath" -Verbose
Start-BitsTransfer -Source https://raw.githubusercontent.com/Vibhu2/PublicRepo/master/ExclaimerScriptDeploymet.ps1 -Destination "$Installpath" -Verbose
Start-BitsTransfer -Source https://raw.githubusercontent.com/Vibhu2/PublicRepo/master/ExclaimerScriptDeploymet.xml -Destination "$Installpath" -Verbose

#Export-ScheduledTask -TaskName "Exclaimer Client Deployment" "\TASK-PATH-TASKSCHEDULER\" | Out-File C:\itconnexx-a\ExclaimerScriptDeploymet.xml
#Get-ScheduledTask -TaskName "Exclaimer Client Deployment" | Export-ScheduledTask | Out-File C:\itconnexx-a\ExclaimerScriptDeploymet.xml
Register-ScheduledTask -xml (Get-Content "C:\itconnexx-a\ExclaimerScriptDeploymet.xml" | Out-String) -TaskName "exclaimer"
#Unregister-ScheduledTask -TaskName "exclaimer" -Confirm:$false