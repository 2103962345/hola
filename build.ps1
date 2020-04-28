Write-Output "PowerShell $($PSVersionTable.PSEdition) version $($PSVersionTable.PSVersion)"

#Set-StrictMode -Version 2.0; $ErrorActionPreference = "Stop"; $ConfirmPreference = "None"; trap { exit 1 }

Write-Host "Congratulations! Your first script executed successfully"
Start-Process -FilePath 'C:\Ruby27-x64\bin\ruby.exe' -ArgumentList 'C:\Users\Administrator\Downloads\hola\1.rb'