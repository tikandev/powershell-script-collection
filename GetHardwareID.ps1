#The script first checks if it's running as admin. If not it will try to prompt for admin rights. 

param([switch]$Elevated)
$OutputDir = "C:\HWID"

function Get-Admin-Status {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Get-Admin-Status) -eq $true) {
    Write-Output "Creating new directory C:\HWID..."

    New-Item -Type Directory -Path $OutputDir
    
    Write-Output "Setting C:\HWID as working directory..."
    
    Set-Location -Path $OutputDir

    Write-Output "Setting correct executionpolicy for the script..."
    
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
    
    Write-Output "Downloading WindowsAutoPilotInfo.ps1.."
    
    Install-Script -Name Get-WindowsAutoPilotInfo
    
    Write-Output "Running the script and exporting the result as AutoPilotHWID.csv into the working dir..."
    
    Get-WindowsAutoPilotInfo -OutputFile AutoPilotHWID.csv
    
    Write-Output  "Script finished!"
    
    explorer C:\HWID
}
else {
    Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}
    

