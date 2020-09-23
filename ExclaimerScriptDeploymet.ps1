
Set-ExecutionPolicy Bypass -scope Process -Force
Get-Process *installer* | Stop-Process -Force

$Installpath= "C:\itconnexx-a"
$path=Test-Path "C:\itconnexx-a"

if (!(test-path $path) )
{New-Item C:\itconnexx-a -ItemType Directory} 

Start-BitsTransfer -Source https://outlookclient.exclaimer.net/csua/Exclaimer.CloudSignatureUpdateAgent.Install.msi -Destination "$Installpath" -Verbose
#New-Item -Path $Installpath\install.bat -ItemType File
Set-Content -Path C:\itconnexx-a\install.bat 'msiexec /i "C:\itconnexx-a\Exclaimer.CloudSignatureUpdateAgent.Install.msi" ALLUSERS=1 /Quiet 
exit'
#start-process C:\itconnexx-a\install.bat
Start-Process -FilePath 'C:\itconnexx-a\Exclaimer.CloudSignatureUpdateAgent.Install.msi' -PassThru '/quiet -m'
#cmd cd C:\Windows\System32
#cmd.exe --% msiexec /i "C:\itconnexx-a\Exclaimer.CloudSignatureUpdateAgent.Install.msi" ALLUSERS=1 /quiet
Start-Sleep -Seconds 60
Remove-Item 'C:\itconnexx-a\Exclaimer.CloudSignatureUpdateAgent.Install.msi'
Remove-Item "C:\itconnexx-a\install.bat"

 #cmd --%'C:\itconnexx-a\Exclaimer.CloudSignatureUpdateAgent.Install.msi /Quiet'
