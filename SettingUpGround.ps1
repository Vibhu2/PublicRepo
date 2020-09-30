Set-ExecutionPolicy Bypass -scope Process -Force
$Installpath= "C:\itconnexx-a"
$ErrorActionPreference= 'silentlycontinue'

$path=Test-Path "C:\itconnexx-a"
$installer=Test-Path "C:\itconnexx-a\Exclaimer.CloudSignatureUpdateAgent.Install.msi"
$script=Test-Path "C:\itconnexx-a\ImprovedDeployment.ps1"
$batchfile=Test-Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\install.bat"

$UniversalStartup='C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp'

#checks for all the required files and if already there it will not downlod the new files one again

if (!(test-path $path) ){New-Item C:\itconnexx-a -ItemType Directory}
if (!(test-path $installer) ){Start-BitsTransfer -Source https://outlookclient.exclaimer.net/csua/Exclaimer.CloudSignatureUpdateAgent.Install.msi -Destination "$Installpath"}
if (!(test-path $script) ){Start-BitsTransfer -Source https://raw.githubusercontent.com/Vibhu2/PublicRepo/master/ImprovedDeployment.ps1 -Destination "$Installpath"}
if (!(test-path $batchfile) ){Start-BitsTransfer -Source https://raw.githubusercontent.com/Vibhu2/PublicRepo/master/install.bat -Destination "$UniversalStartup"}
