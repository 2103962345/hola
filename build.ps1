Write-Output "PowerShell $($PSVersionTable.PSEdition) version $($PSVersionTable.PSVersion)"

#Set-StrictMode -Version 2.0; $ErrorActionPreference = "Stop"; $ConfirmPreference = "None"; trap { exit 1 }

Write-Host "Congratulations! Your first script executed successfully"
Invoke-Expression "ruby $PSScriptRoot\1.rb"
#Start-Process -FilePath ruby -ArgumentList "$PSScriptRoot\1.rb" -NoNewWindow
