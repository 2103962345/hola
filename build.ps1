[CmdletBinding()]
Param(
    [Parameter(Position=0,Mandatory=$false,ValueFromRemainingArguments=$true)]
    [string[]]$BuildArguments
)

Write-Output "PowerShell $($PSVersionTable.PSEdition) version $($PSVersionTable.PSVersion)"

Set-StrictMode -Version 2.0; $ErrorActionPreference = "Stop"; $ConfirmPreference = "None"; trap { exit 1 }
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent

###########################################################################
# CONFIGURATION
###########################################################################
$ruby = "C:\Ruby27-x64\bin\ruby.exe C:\Users\Administrator\Downloads\hola\2.rb"
#$BuildProjectFile = "C:\Users\Administrator\Downloads\hola\1.rb"
$cmd = "C:\Windows\System32\cmd.exe"

###########################################################################
# EXECUTION
###########################################################################

function ExecSafe([scriptblock] $cmd) {
    & $cmd
    if ($LASTEXITCODE) { exit $LASTEXITCODE }
}

ExecSafe { & $ruby }
#Write-Output $BuildProjectFile
#& $BuildProjectFile
#Invoke-Expression -Command "cmd.exe /c $ruby $BuildProjectFile"
