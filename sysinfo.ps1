# sysinfo.ps1 - safe demo script
# Collect system info
$hostname = hostname
$ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike 'Loopback*'} | Select-Object -First 1 -ExpandProperty IPAddress)
$region = (Get-Culture).DisplayName

# Create a new temp file for Notepad
$tempFile = "$env:TEMP\sysinfo_output.txt"

# Write info into the file
"Hostname: $hostname" | Out-File -FilePath $tempFile
"IP Address: $ip" | Out-File -FilePath $tempFile -Append
"Region: $region" | Out-File -FilePath $tempFile -Append

# Open it in Notepad
Start-Process notepad $tempFile
