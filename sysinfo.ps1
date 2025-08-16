# -----------------------------
# Safe system info collector
# -----------------------------

# File to store info
$FileName = "$env:tmp/$env:USERNAME-INFO-$(Get-Date -f yyyy-MM-dd_hh-mm).txt"

# -----------------------------
# Get full name of local user
# -----------------------------
function Get-FullName {
    try {
        $fullName = (Get-LocalUser -Name $env:USERNAME).FullName
    } catch {
        return $env:USERNAME
    }
    return $fullName
}
$fullName = Get-FullName

# -----------------------------
# Get PrimaryOwnerName / email
# -----------------------------
function Get-Email {
    try {
        $email = (Get-CimInstance CIM_ComputerSystem).PrimaryOwnerName
        return $email
    } catch {
        return "No Email Detected"
    }
}
$email = Get-Email

# -----------------------------
# Get Public and Local IPs
# -----------------------------
try { $publicIP = (Invoke-WebRequest ipinfo.io/ip -UseBasicParsing).Content }
catch { $publicIP = "Error getting Public IP" }

$localIPs = Get-NetIPAddress -InterfaceAlias "*Ethernet*","*Wi-Fi*" -AddressFamily IPv4 | 
            Select InterfaceAlias, IPAddress, PrefixOrigin | Out-String

# -----------------------------
# Get MAC addresses
# -----------------------------
$MAC = Get-NetAdapter -Name "*Ethernet*","*Wi-Fi*" | 
       Select Name, MacAddress, Status | Out-String

# -----------------------------
# Output to file
# -----------------------------
$output = @"
Full Name: $fullName
Email: $email

----------------------------
Public IP:
$publicIP

Local IPs:
$localIPs

MAC Addresses:
$MAC
"@

$output | Out-File -FilePath $FileName -Encoding UTF8

Write-Host "System info saved safely to: $FileName"

Start-Process notepad.exe $FileName
