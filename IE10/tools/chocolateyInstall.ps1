$urlToWin7_32bit = "http://download.microsoft.com/download/8/A/C/8AC7C482-BC74-492E-B978-7ED04900CEDE/IE10-Windows6.1-x86-en-us.exe"
$urlToWin7_64bit = "http://download.microsoft.com/download/C/E/0/CE0AB8AE-E6B7-43F7-9290-F8EB0EA54FB5/IE10-Windows6.1-x64-en-us.exe"
Install-ChocolateyPackage 'IE10' 'exe' '' "$urlToWin7_32bit" "$urlToWin7_64bit"
