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

$BuildProjectFile = "$PSScriptRoot\hola.gemspec"
$TempDirectory = "$PSScriptRoot\\.tmp"

###########################################################################
# EXECUTION
###########################################################################

function ExecSafe([scriptblock] $cmd) {
    & $cmd
    if ($LASTEXITCODE) { exit $LASTEXITCODE }
}

# If dotnet is installed locally, and expected version is not set or installation matches the expected version
if ($null -ne (Get-Command "ruby" -ErrorAction SilentlyContinue)) {
    $env:RUBY_EXE = (Get-Command "ruby").Path
}

Write-Output "$(& $env:RUBY_EXE -v)"

ExecSafe { & gem build $BuildProjectFile }