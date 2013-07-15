$ieKey="HKLM:\Software\Microsoft\Internet Explorer"
if(Get-ItemProperty -Path $ieKey -Name "SvcVersion" -ErrorAction SilentlyContinue){
    $ieVersion=(Get-ItemProperty -Path $ieKey -Name "SvcVersion").svcVersion
    $majorVersion = [int]$ieVersion.Substring(0,2)
    $hasIE10 = $majorVersion -gt 9
}
if($hasIE10 -eq $true){
    Write-Host "You currently have IE v$majorVersion installed."
    Write-ChocolateySuccess 'IE10'
}
else {
    $urlToWin7_32bit = "http://download.microsoft.com/download/8/A/C/8AC7C482-BC74-492E-B978-7ED04900CEDE/IE10-Windows6.1-x86-en-us.exe"
    $urlToWin7_64bit = "http://download.microsoft.com/download/C/E/0/CE0AB8AE-E6B7-43F7-9290-F8EB0EA54FB5/IE10-Windows6.1-x64-en-us.exe"
    #3010: Reboot Required and #40013: already instaled are acceptable exit codes
    Install-ChocolateyPackage 'IE10' 'exe' '/Passive /NoRestart' "$urlToWin7_32bit" "$urlToWin7_64bit" -validExitCodes @(0,3010,40013)
    Write-Host "You will likely need to restart your computer for the IE 10 install to take effect." -ForeGroundColor green
}
